<%@ Page Title="Evaluar Proyecto" Language="C#" MasterPageFile="~/Views/Privates/PrivateMaster.Master" AutoEventWireup="true" CodeBehind="EvaluarProyecto.aspx.cs" Inherits="Construccion.Views.Privates.Proyectos.EvaluarProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        function validarRegistro(form1, form2, form3, form4, form5, form6, ventana) {
            var valido = true;

            if (!form1.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje del planteamiento del problema.", "error");
            } else if (!form2.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje de la justificación.", "error");
            } else if (!form3.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje de los objetivos.", "error");
            }else if (!form4.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje de la metodología.", "error");
            } else if (!form5.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje del impacto.", "error");
            } else if (!form6.validate()) {
                valido = false;
                swal("Error", "Verifique el puntaje de los resultados.", "error");
            }
            ventana.hide();
            return valido;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    
        <ext:Window
            ID="Ventana_Confirmar"
            runat="server"
            Title="Advertencia"
            Icon="Error"
            Height="185"
            Width="350"
            BodyStyle="background-color: #fff;"
            BodyPadding="5"
            Modal="true"
            Hidden="true">
            <Content>
                <p style="margin:20px;">Al confirmar el registro de la evaluación no podrás modificar los puntajes nuevamente.</p>
            </Content>
            <Buttons>
                <ext:Button
                    ID="Btn_Guardar_Evaluacion"
                    runat="server"
                    DefaultAlign="center"
                    Text="CONFIRMAR"
                    Icon="Accept">
                    <DirectEvents>
                        <Click OnEvent="Btn_Guardar_Evaluacion_Click"
                            Before="return validarRegistro(#{Form_Puntaje_Planteamiento}, #{Form_Puntaje_Justificacion}, #{Form_Puntaje_Objetivos},
                            #{Form_Puntaje_Metodologia}, #{Form_Puntaje_Impacto}, #{Form_Puntaje_Resultados}, #{Ventana_Confirmar});">
                        </Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>
        </ext:Window>

    <ext:TabPanel
        runat="server"
        Region="Center"
        Title="EVALUACIÓN DE PROYECTOS"
        MaxHeight="1000">
        <Items>
            <%-- FORM PLANTEAMIENTO--%>
            <ext:FormPanel
                runat="server"
                Title="PLANTEAMIENTO"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Planteamiento" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Planteamiento"
                                        runat="server"
                                        FieldLabel="Planteamiento del problema"
                                        AutoScroll="true"
                                        Height="500"
                                        WidthSpec="65%" 
                                        Editable="false"/>

                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                        <ul>
                                                            <li>¿Está bien definido el problema o la necesidad, en lo relacionado con su claridad,
                                                                precisión y pertinencia como iniciativa de extensión?</li>
                                                        </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Planteamiento"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Planteamiento"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 15)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="15"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Planteamiento"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Planteamiento_Click" Before="return App.Content_Form_Puntaje_Planteamiento.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM JUSTIFICACION--%>
            <ext:FormPanel
                runat="server"
                Title="JUSTIFICACIÓN"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Justificacion" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Justificacion"
                                        runat="server"
                                        FieldLabel="Justificación"
                                        AutoScroll="true"
                                        Height="500"
                                        WidthSpec="65%" 
                                        Editable="false"/>
                                    
                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                        <ul>
                                                            <li>¿Ofrece niveles de argumentación desde puntos de vista académico, investigativo y social?</li>
                                                            <li>¿Se enmarca en una problemática crucial o importante en la comunidad respectiva, si 
                                                                corresponde a un tema objeto del conocimiento que no necesariamente es de frontera,
                                                                pero es de gran importancia para la región o el país, o formula nuevas alternativas?</li>
                                                            <li>¿El proyecto permite la generación de conocimiento acerca de la comunidad respectiva?</li>
                                                            <li>¿Se puede establecer la contribución del proyecto a la consolidación de los procesos 
                                                                de docencia, investigación y extensión?</li>
                                                        </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Justificacion"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Justificacion"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 15)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="15"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Justificacion"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Justificacion_Click" Before="return App.Content_Form_Puntaje_Planteamiento.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM OBJETIVOS--%>
            <ext:FormPanel
                runat="server"
                Title="OBJETIVOS"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Objetivos" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:FieldContainer
                                        runat="server"
                                        WidthSpec="65%">
                                        <Items>
                                            <ext:TextArea
                                                ID="TA_General"
                                                runat="server"
                                                FieldLabel="Objetivo general"
                                                AutoScroll="true"
                                                Height="100"
                                                WidthSpec="100%"
                                                Editable="false" />
                                            <ext:TextArea
                                                ID="TA_Especificos"
                                                runat="server"
                                                FieldLabel="Objetivos específicos"
                                                AutoScroll="true"
                                                Height="200"
                                                WidthSpec="100%"
                                                Editable="false" />
                                        </Items>
                                    </ext:FieldContainer>
                                    
                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                        <ul>
                                                            <li>¿Están vinculados con el problema y justificación planteada? </li>
                                                            <li>¿Son viables, claros, concretos y factibles, de acuerdo con el estudio y los métodos que se proponen?</li>
                                                            <li>¿Existe coherencia entre el objetivo general y los específicos?</li>
                                                        </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Objetivos"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Objetivos"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 15)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="15"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Objetivos"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Objetivos_Click" Before="return App.Content_Form_Puntaje_Objetivos.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM METODOLOGIA--%>
            <ext:FormPanel
                runat="server"
                Title="METODOLOGÍA"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Metodologia" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Metodologia"
                                        runat="server"
                                        FieldLabel="Metodología"
                                        AutoScroll="true"
                                        Height="500"
                                        WidthSpec="65%" 
                                        Editable="false"/>
                                    
                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                        <ul>
                                                            <li>¿Presenta claridad, pertinencia, consistencia, validez y confiabilidad la metodología y las técnicas 
                                                        cuantitativas y cualitativas, con relación a los objetivos y los resultados esperados?</li>
                                                            <li>¿Responde a los objetivos planteados?</li>
                                                        </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Metodologia"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Metodologia"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 15)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="15"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Metodologia"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Metodologia_Click" Before="return App.Content_Form_Puntaje_Metodologia.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM IMPACTO--%>
            <ext:FormPanel
                runat="server"
                Title="IMPACTO Y PERTINENCIA SOCIAL"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Impacto" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Impacto"
                                        runat="server"
                                        FieldLabel="Impacto y pertinencia social"
                                        AutoScroll="true"
                                        Height="250"
                                        WidthSpec="65%" 
                                        Editable="false"/>
                                    
                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                        <ul>
                                                            <li>¿Aporta a la resolución de problemas concretos de la realidad, incluida la del conocimiento?</li>
                                                            <li>¿La propuesta permite evidenciar algún efecto producido en un grupo, comunidad, institución, etc.? </li>
                                                            <li>¿Es clara la relación del proyecto con el Plan de Desarrollo Institucional, Municipal, Departamental 
                                                                y Nacional?</li>
                                                        </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Impacto"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Impacto"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 15)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="15"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Impacto"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Impacto_Click" Before="return App.Content_Form_Puntaje_Impacto.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM RESULTADOS--%>
            <ext:FormPanel
                runat="server"
                Title="RESULTADOS ESPERADOS"
                Icon="PageEdit"
                AutoScroll="true">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Resultados" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Resultados"
                                        runat="server"
                                        FieldLabel="Resultados esperados"
                                        AutoScroll="true"
                                        Height="250"
                                        WidthSpec="65%" 
                                        Editable="false"/>
                                    
                                    <ext:FieldContainer
                                        WidthSpec="35%"
                                        runat="server">
                                        <Items>
                                            <ext:Container
                                                runat="server"
                                                WidthSpec="100%"
                                                MarginSpec="0 0 0 40"
                                                PaddingSpec="0 40 0 0">
                                                <Content>
                                                    <h3>Ítems de Evaluación</h3>
                                                    <ul>
                                                        <li>¿Son adecuados y/o coherentes las actividades con los resultados esperados y éstos con los objetivos 
                                                        del proyecto? </li>
                                                        <li>¿Son suficientes y adecuados los mecanismos de comunicación escrita y socialización de resultados 
                                                        en la comunidad beneficiaria?</li>
                                                    </ul>
                                                    <br />
                                                </Content>
                                            </ext:Container>

                                            <ext:FormPanel
                                                ID="Form_Puntaje_Resultados"
                                                runat="server"
                                                MarginSpec="0 0 0 80"
                                                DefaultMsgTarget="side">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="TF_Puntaje_Resultados"
                                                        runat="server"
                                                        FieldLabel="Puntaje (0 - 10)"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        MaxValue="10"
                                                        MinValue="0"
                                                        Editable="false"/>
                                                    <ext:Button
                                                        runat="server"
                                                        Text="Guardar"
                                                        ID="Btn_Puntaje_Resultados"
                                                        Icon="DatabaseSave"
                                                        Visible="false">
                                                        <DirectEvents>
                                                            <Click OnEvent="Btn_Puntaje_Resultados_Click" Before="return App.Content_Form_Puntaje_Resultados.validate();">
                                                                <EventMask ShowMask="true" Msg="Verificando..." MinDelay="1000" />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:Button>
                                                </Items>
                                            </ext:FormPanel>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
            <%-- FORM OBSERVACIONES--%>
            <ext:FormPanel
                runat="server"
                Title="OBSERVACIONES"
                Icon="PageEdit"
                AutoScroll="true"
                ID="FP_Finalizar">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter
                        Name="padding"
                        Value="0 50 0 50"
                        Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldSet
                        runat="server">
                        <Defaults>
                            <ext:Parameter
                                Name="margin"
                                Value="15 0"
                                Mode="Value" />
                        </Defaults>
                        <Items>
                            <ext:FieldContainer runat="server">
                                <Items>
                                    <ext:Label runat="server" ID="Lbl_Finalizar" StyleSpec="font-weight: bold;"></ext:Label>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                runat="server"
                                Layout="VBoxLayout">
                                <Items>
                                    <ext:TextArea
                                        ID="TA_Observaciones"
                                        runat="server"
                                        FieldLabel="Observaciones generales"
                                        AutoScroll="true"
                                        Height="250"
                                        WidthSpec="65%"
                                        EmptyText="Ingrese observaciones sobre el proyecto (Opcional)"
                                        EnforceMaxLength="true"
                                        MaxLength="4000"
                                        Editable="false" />

                                    <ext:Button
                                        runat="server"
                                        Text="GUARDAR EVALUACIÓN"
                                        ID="Btn_Modal_Guardar"
                                        Icon="DatabaseSave"
                                        Height="50"
                                        OnClientClick="#{Ventana_Confirmar}.show();"
                                        Visible="false">
                                    </ext:Button>
                                </Items>
                            </ext:FieldContainer>
                        </Items>
                    </ext:FieldSet>
                </Items>
            </ext:FormPanel>
            
        </Items>
    </ext:TabPanel>
</asp:Content>

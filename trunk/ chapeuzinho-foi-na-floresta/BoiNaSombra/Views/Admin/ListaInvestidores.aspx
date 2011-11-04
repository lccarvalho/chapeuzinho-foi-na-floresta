<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminDefault.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<div id="ListaInvestidores">
		<fieldset>
			<ul>
				<li>João</li>
				<li>Pedrão</li>
			</ul>
		</fieldset>
	</div>
	<div id="Search">
		<!--aqui deve ser uma partial view para investidores-->
		<table>
			<tbody>
				<tr>
					<td>
						<label>Nome:</label>
					</td>

					<td>
						<input type="text" />
					</td>
				</tr>

				<tr>
					<td>
						<label>Endereço:</label>
					</td>

					<td>
						<input type="text" />
					</td>
				</tr>

				<tr>
					<td>
						<label>Email:</label>
					</td>

					<td>
						<input type="text" />
					</td>
				</tr>

				<tr>
					<td>
						<label>Telefone:</label>
					</td>

					<td>
						<input type="text" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<button type="button">Editar</button>
		<button type="button">Ver conta</button>
	</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
	<link rel="Stylesheet" type="text/css" href="../../Content/Admin/ListaInvestidores.css" />
</asp:Content>

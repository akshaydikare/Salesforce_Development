<aura:application extends="force:slds">
	<lightning:notificationsLibrary aura:id="notifLib"/>
	<lightning:button name="toast" label="Show Toast" onclick="{!c.handleShowToast}"/>

</aura:application>
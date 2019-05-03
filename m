Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210E131A5
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 17:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SFmbaiTqrhlgaz7tQTg13WLUFcFTht0gLUXMdJ1yKQk=; b=fvhqdaLzgDUlE+hkMcDjI7H2xN
	q5VbgT6C8ZxOz0eO3bQy1zSilOIO6yqQjCtYcn9a2aHGM3z4wxwBpCdNmLhItLvpLD0BTDF4NgNcb
	PFUFl1Z61G6iUQ5WF5jbiVQzzZMd2EMPuZK22k+iCMATZb7vHUXEs1HSMMLfkNGDae+gXgJ0eBjVP
	ZbQVt4FAHF93afLDLO/8F9c37SBzDTc/whCRaxPLo8Po3gmHJ9CQUP69bzMzia6XZGgq4dRSCVJZe
	uzhJ7dGKaqG7oZt8N//Qgmsm7F13CHnqMqr0Ew7H2B5w911MV1d38OF82drQ/nHbQD2niEUDHOiCv
	xAl9An8w==;
Received: from localhost ([::1]:28598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMaaQ-002J51-9n; Fri, 03 May 2019 15:58:58 +0000
Received: from mail.pardus.org.tr ([193.140.98.156]:41278) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMaaM-002J4a-2S
 for samba-technical@lists.samba.org; Fri, 03 May 2019 15:58:56 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id F227C1F5257
 for <samba-technical@lists.samba.org>; Fri,  3 May 2019 18:58:50 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zBxINJVIhalc for <samba-technical@lists.samba.org>;
 Fri,  3 May 2019 18:58:50 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id 3AC381F5259
 for <samba-technical@lists.samba.org>; Fri,  3 May 2019 18:58:50 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MZh-eO-C2owS for <samba-technical@lists.samba.org>;
 Fri,  3 May 2019 18:58:50 +0300 (+03)
Received: from [172.16.103.12] (unknown [161.9.194.129])
 by mail.pardus.org.tr (Postfix) with ESMTPSA id F3CBF1F5257
 for <samba-technical@lists.samba.org>; Fri,  3 May 2019 18:58:49 +0300 (+03)
Message-ID: <5CCC6539.4010105@pardus.org.tr>
Date: Fri, 03 May 2019 18:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Subject: Samba AD DC Password Expiry problem
Content-Type: text/plain; charset=windows-1254; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?windows-1254?Q?Izzet_Ayd=FDn?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?windows-1254?Q?Izzet_Ayd=FDn?= <izzet.aydin@pardus.org.tr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

I am trying to force a user to change his password at login screen, ( 
test2 is the username ) with the following command

samba-tool user setpassword test2 --must-change-at-next-login

Client computer is configured and joined to domain. However, when i try 
to login in lightdm, i see the following line in auth.log

  pam_winbind(lightdm:auth): request wbcLogonUser failed: 
WBC_ERR_AUTH_ERROR, PAM error: PAM_AUTHTOK_EXPIRED (27), NTSTATUS: 
NT_STATUS_PASSWORD_EXPIRED, Error message was: Password expired

but the user is still able to login.

If i configure another client computer with gnome interface, i get the 
same auth.log message, but in this case i see the password expired 
message in gdm. Yet no user password change interrupts appears.

I auto-configured my pam files with pam-auth-update. What can be the 
error ?

I add my pam and smb.conf files below

Thanks
/etc/pam.d/common-account
::::::::::::::
#
# /etc/pam.d/common-account - authorization settings common to all services


# here are the per-package modules (the "Primary" block)
account    [success=2 new_authtok_reqd=done default=ignore] pam_unix.so
account    [success=1 new_authtok_reqd=done default=ignore] pam_winbind.so
# here's the fallback if no module succeeds
account    requisite            pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
account    required            pam_permit.so
# and here are more per-package modules (the "Additional" block)
# end of pam-auth-update config

/etc/pam.d/common-auth
::::::::::::::

# here are the per-package modules (the "Primary" block)
auth    [success=2 default=ignore]    pam_unix.so nullok_secure
auth    [success=1 default=ignore]    pam_winbind.so krb5_auth 
krb5_ccache_type=FILE cached_login try_first_pass
# here's the fallback if no module succeeds
auth    requisite            pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
auth    required            pam_permit.so
# and here are more per-package modules (the "Additional" block)
# end of pam-auth-update config

/etc/pam.d/common-password
::::::::::::::

# here are the per-package modules (the "Primary" block)
password    [success=2 default=ignore]    pam_unix.so obscure sha512
password    [success=1 default=ignore]    pam_winbind.so try_authtok 
try_first_pass
# here's the fallback if no module succeeds
password    requisite            pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
password    required            pam_permit.so
# and here are more per-package modules (the "Additional" block)
password    optional    pam_gnome_keyring.so
# end of pam-auth-update config

/etc/pam.d/common-session
::::::::::::::

# here are the per-package modules (the "Primary" block)
session    [default=1]            pam_permit.so
# here's the fallback if no module succeeds
session    requisite            pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
session    required            pam_permit.so
# and here are more per-package modules (the "Additional" block)
session    required    pam_unix.so
session    optional            pam_winbind.so
session    optional    pam_systemd.so
session    optional            pam_mkhomedir.so
# end of pam-auth-update config

/etc/samba/smb.conf
[global]
realm = test.local
workgroup = TEST
security = ads
password server = xxx.xx.xx.xx
#wins server = IP of wins server
security = ads
idmap uid = 10000-20000
idmap gid = 10000-20000
template shell = /bin/bash
winbind use default domain = yes
winbind offline logon = false
#winbind separator = +
#allow trusted domains = Yes





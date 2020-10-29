Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 192AD29F0C2
	for <lists+samba-technical@lfdr.de>; Thu, 29 Oct 2020 17:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Vuih/gD0Zb5Dx+XNDtHPR7snd/kyh/bhKaxvvqwllxM=; b=11yGvZA9W2KMW5bTK4ntf8bx1e
	FgIErSAWa8sCngKEj8uYfz4c+ElCGWin59tka6/mYkMhXlHV+HduJzv8dPCJXGOpjY9DeTnjrlSSi
	l+jyVjf2Gp/DiTnHGs0e0mY6wp3npHQwjKqp6rzsqpR24kSWHAUUOrOHmhqNEw5NVFFYvc9JMo6Sv
	C95i2VN8Bxu18Iv7ikiGNvK0AU7pIP7t+uiTF47EF6YLHYB8qfF77ScrOdSQBlsrNwAFalhamhxAi
	AcIN4B7GFRwcf+cLvF632FDlCUFksdqde/aLx1k6RuWmpmYx3kGGLcg6O9BSbJshrMnP2VCnYGScj
	g6H3268A==;
Received: from ip6-localhost ([::1]:47456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYASi-00EPi4-Nr; Thu, 29 Oct 2020 16:07:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58476) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYASd-00EPhx-Qh
 for samba-technical@lists.samba.org; Thu, 29 Oct 2020 16:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Vuih/gD0Zb5Dx+XNDtHPR7snd/kyh/bhKaxvvqwllxM=; b=DZFewpEPrxKBROjrrORpwpAdBT
 LLAsNN6y84K/qer0AcP19OEQfEDQeMnFSp1kgMAYis9Ukkxkco5oCJ/YcUg1usoPYpgSWOXnHyHyN
 fAahBUbnEaiiIv/WOwaNlEzBhlVbaDFrJXH0CBK3fYfzW5sv67XwKXgY6G7tRnKCpFf02Slj+9ISw
 jhaqu0CZARYjexC1cZh0Ze990IpRInO3vb6aCbDHGku1vAumh7NHOeXSrV83R76IK+xaRVxqeTaEb
 CCS3AE19h0m5hzXXaLz/cRbWICTbyU1dLTLGsK+QLOfU2WIDe+s2HXyVV0uMfHX9ud6wPfGeWQqvO
 KXU9RH5quolmrgjy5SIP8+RjMuQ3i5lVCaSCPB6OxZSXuzh+GE87xhiMkI51YaiG8Li8D8g3JHhRw
 Ux0NAooljCNNX3Xu7nGPq+iWQFE3RzmtMujOp+gl9bO0600sMnnPM01x1FXi0TmAjk7Xp3UmD1jpD
 20HgMZEcss29CErJF3lK1f6+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kYASd-0006QO-DR; Thu, 29 Oct 2020 16:07:35 +0000
To: "'Xiaoli Feng'" <xifeng@redhat.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
In-Reply-To: <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
Subject: RE: can't start smbd after install samba posix branch
Date: Thu, 29 Oct 2020 17:07:35 +0100
Message-ID: <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdauDZ0CO0bxapYBSY2MFkNESAwnyg==
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

See: https://bugzilla.samba.org/show_bug.cgi?id=14552 

This might help, quick test is 

systemctl edit smbd
Add 

[Unit]
NotifyAccess=all


Greetz, 

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens 
> Xiaoli Feng via samba-technical
> Verzonden: donderdag 29 oktober 2020 16:43
> Aan: samba-technical; CIFS
> CC: jra@samba.org; Ronnie Sahlberg
> Onderwerp: can't start smbd after install samba posix branch
> 
> Hello folks,
> 
> I try to install samba posix branch in RHEL8. But failed to 
> start smbd daemon.
> Does anyone know the reason? or what else do I miss?
> 
> #git clone git://git.samba.org/jra/samba
> #git check -b posix remotes/origin/master-smb2
> #./configure --prefix=/usr --enable-fhs
> #make -j6
> #make install
> #smbd -D
> # echo $?
> 1
> # smbd -D -d 10
> INFO: Current debug levels:
>   all: 10
>   tdb: 10
>   printdrivers: 10
>   lanman: 10
>   smb: 10
>   rpc_parse: 10
>   rpc_srv: 10
>   rpc_cli: 10
>   passdb: 10
>   sam: 10
>   auth: 10
>   winbind: 10
>   vfs: 10
>   idmap: 10
>   quota: 10
>   acls: 10
>   locking: 10
>   msdfs: 10
>   dmapi: 10
>   registry: 10
>   scavenger: 10
>   dns: 10
>   ldb: 10
>   tevent: 10
>   auth_audit: 10
>   auth_json_audit: 10
>   kerberos: 10
>   drs_repl: 10
>   smb2: 10
>   smb2_credits: 10
>   dsdb_audit: 10
>   dsdb_json_audit: 10
>   dsdb_password_audit: 10
>   dsdb_password_json_audit: 10
>   dsdb_transaction_audit: 10
>   dsdb_transaction_json_audit: 10
>   dsdb_group_audit: 10
>   dsdb_group_json_audit: 10
> [root@hp-dl360g9-12 ~]# echo $?
> 1
> 
> I don't find any usefull log. Then I use systemd to start 
> smbd services. Show this error:
> -- Unit smb.service has begun starting up.
> Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com 
> systemd[1]: smb.service: Main process exited, code=exited, 
> status=1/FAILURE
> Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com 
> systemd[1]: smb.service: Failed with result 'exit-code'.
> -- Subject: Unit failed
> -- Defined-By: systemd
> -- Support: https://access.redhat.com/support
> -- 
> -- The unit smb.service has entered the 'failed' state with 
> result 'exit-code'.
> Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com 
> systemd[1]: Failed to start Samba SMB Daemon.
> -- Subject: Unit smb.service has failed
> 
> 
> 
> Thanks.
> 
> 
> 
> 
> 



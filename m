Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6581EE7C1
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jun 2020 17:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VxMBvV47KXP0sVqjTD5RyorOEY0pqVa8BaX/szR4Fzk=; b=iBFqPsEFZouhIhzBlq+h/QRokn
	DfYhS/8Q+kxRj6uKTTmB5FlCLfiv/NVCVtzsWFiatPh7uG2XOc5WzBD+vJBK8puffXWQI8KNO+In7
	IaoskbbvVgQHVfy1tsU7rXKc/rZlxXhah0dJtvDSTbknTfwk9Mi6lM6wdVdmBCifyCTtcOZClHaJZ
	XdvSmExU+DpEuFSLqzvQ8tX67Fkv0ZJ45+B0qtRG3v+VTnacIgqWlrN3CBEcjyzmXl16b0hnZsii/
	UEn4rdyqHRXnp/2cYjU+Nk7OkWm2im0m/6PUDIlui9F0htoTwBj536hXAaHgNphDRLFRaFGkPNsBL
	PBphZ9ig==;
Received: from localhost ([::1]:20250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgrmI-008tod-Bk; Thu, 04 Jun 2020 15:27:34 +0000
Received: from [80.20.169.36] (port=58583 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jgrmD-008toV-2S
 for samba-technical@lists.samba.org; Thu, 04 Jun 2020 15:27:31 +0000
Received: (qmail 13686 invoked by uid 121); 4 Jun 2020 17:00:45 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25832. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.256348 secs); 04 Jun 2020 15:00:45 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 4 Jun 2020 17:00:45 +0200
Message-ID: <86d98975b6cc2de9fee96921efbb08a93ed59a8b.camel@solinos.it>
Subject: Fedora 32 MIT Kerberos and samba 4.12.2: Remote Desktop application
 cannot login from win to another win with domain users
To: Samba Technical <samba-technical@lists.samba.org>
Date: Thu, 04 Jun 2020 17:00:44 +0200
Organization: Solinos
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I work on a test environment to test samba AD with MIT kerberos out of
the box.

I have a AD-DC samba on Fedora 32 (addc1), a Centos 8 member server
(centos8) and two PC windows 10 (win10a and win10b), fedora.loc is the
AD REALM test domain name

All work fine, except to access from windows to windows with remote
desktop. 

I work on win10b with user administrator@fedora.loc and if I try to
access to win10a with remote desktop, not work.
I get a password request and I cannot access with domain users, I can
access only with win10a local user enabled.

This is what I get into /var/log/samba/mit_kdc.log:

mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): AS_REQ (6 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135), UNSUPPORTED:des-cbc-md5(3)}) 192.168.122.102: NEEDED_PREAUTH: Administrator@FEDORA for krbtgt/FEDORA@FEDORA, Additional pre-authentication required
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): AS_REQ (6 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135), UNSUPPORTED:des-cbc-md5(3)}) 192.168.122.102: ISSUE: authtime 1589554729, etypes {rep=aes256-cts-hmac-sha1-96(18), tkt=aes256-cts-hmac-sha1-96(18), ses=aes256-cts-hmac-sha1-96(18)}, Administrator@FEDORA for krbtgt/FEDORA@FEDORA
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ (5 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135)}) 192.168.122.102: ISSUE: authtime 1589554729, etypes {rep=aes256-cts-hmac-sha1-96(18), tkt=aes256-cts-hmac-sha1-96(18), ses=aes256-cts-hmac-sha1-96(18)}, Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ 192.168.122.102: 2ND_TKT_MISMATCH: authtime 1589554729, Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC, 2nd tkt client WIN10A$@FEDORA.LOC
mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19

If I try to access via file manager to some shared folder on win10a
(\\win10a\share\) all work fine.

Also if I try to access to win10a from Linux Fedora addc1 server with
xfreerdp utility ( via ssh -XY addc1) all work fine and I can access
without problem, this is the log session:

[lesca@addc1 ~]$ xfreerdp  /u:administrator@fedora.loc /v:win10a.fedora.loc
[18:01:32:549] [2340:2341] [INFO][com.freerdp.core] - freerdp_connect:freerdp_set_last_error_ex resetting error state
[18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpdr
[18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpsnd
[18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx cliprdr
[18:01:35:857] [2340:2341] [INFO][com.freerdp.primitives] - primitives autodetect, using optimized
[18:01:35:864] [2340:2341] [INFO][com.freerdp.core] - freerdp_tcp_is_hostname_resolvable:freerdp_set_last_error_ex resetting error state
[18:01:35:867] [2340:2341] [INFO][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex resetting error state
[18:01:35:886] [2340:2341] [WARN][com.freerdp.crypto] - Certificate verification failure 'unable to get local issuer certificate (20)' at stack position 0
[18:01:35:886] [2340:2341] [WARN][com.freerdp.crypto] - CN = win10a.fedora.loc
Password: 
[18:01:39:264] [2340:2341] [INFO][com.freerdp.gdi] - Local framebuffer format  PIXEL_FORMAT_BGRX32
[18:01:39:265] [2340:2341] [INFO][com.freerdp.gdi] - Remote framebuffer format PIXEL_FORMAT_RGB16
[18:01:40:343] [2340:2341] [INFO][com.winpr.clipboard] - initialized POSIX local file subsystem
[18:01:41:829] [2340:2341] [INFO][com.freerdp.channels.rdpsnd.client] - Loaded fake backend for rdpsnd
[18:02:12:906] [2340:2341] [INFO][com.freerdp.core] - rdp_set_error_info:freerdp_set_last_error_ex resetting error state
[18:02:12:906] [2340:2347] [WARN][com.freerdp.channels.cliprdr.common] - [cliprdr_packet_format_list_new] called with invalid type 00000000

I have fill this RedHat bug:
https://bugzilla.redhat.com/show_bug.cgi?id=1836630

I must fill also a bug on samba bugzilla?

Here some comment get on Fedora ML

> From Alexander Bokovoy
> This is one of user-to-user authentication cases that aren't
> implemented 
> properly in MIT Kerberos and Samba AD for aliases (SPNs) of the
> machine
> account:
> 
>   19 mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ
>   192.168.122.102: 2ND_TKT_MISMATCH: authtime 1589554729,
>   Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC, 2nd tkt
>   client WIN10A$@FEDORA.LOC
>   mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down
> fd
> 
> From Windows point of view TERMSRV/win10a is a service principal
> name of
> the WIN10A$ machine account, so they share the same key and are seen
> at
> the same principal for the check that is being done here. For MIT
> Kerberos, it doesn't see them as aliases as it does explicit compare
> of
> the principals and requested service principal does not match the
> principal in the evidence (2nd) ticket.


> From Isaac Boukris:
> From the code context of the '2ND_TKT_MISMATCH' error, it looks like
> it is doing user-to-user authentication (KDC_OPT_ENC_TKT_IN_SKEY).
> 
> Sounds like we might need to invoke krb5_db_check_alias() from PR
> 
> #1014 here as well.


Many thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 32 Workstation)



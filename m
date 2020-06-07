Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 991461F0A12
	for <lists+samba-technical@lfdr.de>; Sun,  7 Jun 2020 06:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZSYCXEwcdW9POhDAtKi6Q3BJCiAmXXNICysxUlGluZE=; b=oc3oBsQnEu+s8EXO3KmSv5EpYN
	tPuRDkuejvfZ9UQodF9yiJlpPqd7DvjWh2GMrzC6tOspZyLdHh45NhI3aAB+m6tydFS3+Z3kuWr6+
	jQ+rmDwVzTjBRFdJyt4K5NZJbZ5d9Bnkyjy8KRXNviHT81v41wm7jJ2FiFJi+Wo2IJdUKJ4G24nU+
	1g3vEh3lw4bA4ZwkvF/DrSMd935heUMDvEx0lINja5lXLYZuxL2yiIPSRvk2gSpHwt15TL5pJ0XQM
	J9TIgDVbx/ZXskMh0+thCtXAKk31qv9L9xdMNYgr3l4XSV4cE0ikdgOujd4P0FT5MIZCPn03xlW1D
	jWOE5sXA==;
Received: from localhost ([::1]:61400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jhnHm-009KsW-E3; Sun, 07 Jun 2020 04:51:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jhnHg-009KsP-Sg
 for samba-technical@lists.samba.org; Sun, 07 Jun 2020 04:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZSYCXEwcdW9POhDAtKi6Q3BJCiAmXXNICysxUlGluZE=; b=qL468X8P2rF3S4OiU05dXbFR0j
 ZUfcEunrM1uS9HxWzx6gnqvmS7OR3QI0cQjxaxdlOj0EpKcEW8wPbheczigETZoCCOIyKCOpgHH0v
 JPAKzbGYHSSEgtFKoy8N/gKF4teuy81Dy8sg3o3vfPd2k+2ZlMH5tlMw6LxBTiWkXpY5xP8y10ldb
 XYWnwp7SUto7RLDOqqkqzq5NVGRL85i/QBGTTaWtvKx/Vd8r0UwgjGZQsy+47DU7Yq5B9Ph+O7RLq
 nw0r0jmYT0TT5mD9XcP5hES2Kj0Gg19SnNW68gmrXG5KlzergmxVWTjozvMKGY3XLk2gctmUEwWWO
 RVgVSwKp8M1K16SkiXr3OCLVMVuiAaqeMw+KuiUxYbYTYp35Sv5h/f2Wh1t9+xmTK+daMUrCLmgdh
 w6yTX3JcaeLpChOih5c1bR8CLwT6aStOue4pLS6AJLdYihnffoR7KZigm/XCML7j0JPUABZjUYxp9
 1cgZAiJ8RGznW8fES/lOREHg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jhnHd-0002TD-KO; Sun, 07 Jun 2020 04:51:45 +0000
Date: Sun, 7 Jun 2020 07:51:42 +0300
To: Dario Lesca <d.lesca@solinos.it>
Subject: Re: Fedora 32 MIT Kerberos and samba 4.12.2: Remote Desktop
 application cannot login from win to another win with domain users
Message-ID: <20200607045142.GA2885535@onega.vda.li>
References: <86d98975b6cc2de9fee96921efbb08a93ed59a8b.camel@solinos.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86d98975b6cc2de9fee96921efbb08a93ed59a8b.camel@solinos.it>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 04 kesä 2020, Dario Lesca via samba-technical wrote:
> I work on a test environment to test samba AD with MIT kerberos out of
> the box.
> 
> I have a AD-DC samba on Fedora 32 (addc1), a Centos 8 member server
> (centos8) and two PC windows 10 (win10a and win10b), fedora.loc is the
> AD REALM test domain name
> 
> All work fine, except to access from windows to windows with remote
> desktop. 
> 
> I work on win10b with user administrator@fedora.loc and if I try to
> access to win10a with remote desktop, not work.
> I get a password request and I cannot access with domain users, I can
> access only with win10a local user enabled.
> 
> This is what I get into /var/log/samba/mit_kdc.log:
> 
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): AS_REQ (6 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135), UNSUPPORTED:des-cbc-md5(3)}) 192.168.122.102: NEEDED_PREAUTH: Administrator@FEDORA for krbtgt/FEDORA@FEDORA, Additional pre-authentication required
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): AS_REQ (6 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135), UNSUPPORTED:des-cbc-md5(3)}) 192.168.122.102: ISSUE: authtime 1589554729, etypes {rep=aes256-cts-hmac-sha1-96(18), tkt=aes256-cts-hmac-sha1-96(18), ses=aes256-cts-hmac-sha1-96(18)}, Administrator@FEDORA for krbtgt/FEDORA@FEDORA
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ (5 etypes {aes256-cts-hmac-sha1-96(18), aes128-cts-hmac-sha1-96(17), DEPRECATED:arcfour-hmac(23), DEPRECATED:arcfour-hmac-exp(24), UNSUPPORTED:(-135)}) 192.168.122.102: ISSUE: authtime 1589554729, etypes {rep=aes256-cts-hmac-sha1-96(18), tkt=aes256-cts-hmac-sha1-96(18), ses=aes256-cts-hmac-sha1-96(18)}, Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ 192.168.122.102: 2ND_TKT_MISMATCH: authtime 1589554729, Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC, 2nd tkt client WIN10A$@FEDORA.LOC
> mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down fd 19
> 
> If I try to access via file manager to some shared folder on win10a
> (\\win10a\share\) all work fine.
> 
> Also if I try to access to win10a from Linux Fedora addc1 server with
> xfreerdp utility ( via ssh -XY addc1) all work fine and I can access
> without problem, this is the log session:
> 
> [lesca@addc1 ~]$ xfreerdp  /u:administrator@fedora.loc /v:win10a.fedora.loc
> [18:01:32:549] [2340:2341] [INFO][com.freerdp.core] - freerdp_connect:freerdp_set_last_error_ex resetting error state
> [18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpdr
> [18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpsnd
> [18:01:32:549] [2340:2341] [INFO][com.freerdp.client.common.cmdline] - loading channelEx cliprdr
> [18:01:35:857] [2340:2341] [INFO][com.freerdp.primitives] - primitives autodetect, using optimized
> [18:01:35:864] [2340:2341] [INFO][com.freerdp.core] - freerdp_tcp_is_hostname_resolvable:freerdp_set_last_error_ex resetting error state
> [18:01:35:867] [2340:2341] [INFO][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex resetting error state
> [18:01:35:886] [2340:2341] [WARN][com.freerdp.crypto] - Certificate verification failure 'unable to get local issuer certificate (20)' at stack position 0
> [18:01:35:886] [2340:2341] [WARN][com.freerdp.crypto] - CN = win10a.fedora.loc
> Password: 
> [18:01:39:264] [2340:2341] [INFO][com.freerdp.gdi] - Local framebuffer format  PIXEL_FORMAT_BGRX32
> [18:01:39:265] [2340:2341] [INFO][com.freerdp.gdi] - Remote framebuffer format PIXEL_FORMAT_RGB16
> [18:01:40:343] [2340:2341] [INFO][com.winpr.clipboard] - initialized POSIX local file subsystem
> [18:01:41:829] [2340:2341] [INFO][com.freerdp.channels.rdpsnd.client] - Loaded fake backend for rdpsnd
> [18:02:12:906] [2340:2341] [INFO][com.freerdp.core] - rdp_set_error_info:freerdp_set_last_error_ex resetting error state
> [18:02:12:906] [2340:2347] [WARN][com.freerdp.channels.cliprdr.common] - [cliprdr_packet_format_list_new] called with invalid type 00000000
> 
> I have fill this RedHat bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=1836630
> 
> I must fill also a bug on samba bugzilla?

As I said, it is a bug in MIT Kerberos, not Samba.
We discussed this with Isaac and we need to fix it MIT upstream. Sorry,
last two weeks were too busy for me.

> 
> Here some comment get on Fedora ML
> 
> > From Alexander Bokovoy
> > This is one of user-to-user authentication cases that aren't
> > implemented 
> > properly in MIT Kerberos and Samba AD for aliases (SPNs) of the
> > machine
> > account:
> > 
> >   19 mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): TGS_REQ
> >   192.168.122.102: 2ND_TKT_MISMATCH: authtime 1589554729,
> >   Administrator@FEDORA.LOC for TERMSRV/win10a@FEDORA.LOC, 2nd tkt
> >   client WIN10A$@FEDORA.LOC
> >   mag 15 16:58:49 addc1.fedora.loc krb5kdc[821](info): closing down
> > fd
> > 
> > From Windows point of view TERMSRV/win10a is a service principal
> > name of
> > the WIN10A$ machine account, so they share the same key and are seen
> > at
> > the same principal for the check that is being done here. For MIT
> > Kerberos, it doesn't see them as aliases as it does explicit compare
> > of
> > the principals and requested service principal does not match the
> > principal in the evidence (2nd) ticket.
> 
> 
> > From Isaac Boukris:
> > From the code context of the '2ND_TKT_MISMATCH' error, it looks like
> > it is doing user-to-user authentication (KDC_OPT_ENC_TKT_IN_SKEY).
> > 
> > Sounds like we might need to invoke krb5_db_check_alias() from PR
> > 
> > #1014 here as well.
> 
> 
> Many thanks
> 
> -- 
> Dario Lesca
> (inviato dal mio Linux Fedora 32 Workstation)
> 
> 

-- 
/ Alexander Bokovoy


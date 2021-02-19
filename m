Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EE31FE56
	for <lists+samba-technical@lfdr.de>; Fri, 19 Feb 2021 18:51:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+M+W8DkF5+EZIcp0whyJp0l+5eP5fd9n9yf04AU6DPA=; b=vNS1XpMR1TFXVo5YH/7qzEy+/G
	CIllsLHl04bFZdisZldlf45XTiFxCIhT+SuNOdop/l0clZDrFDBdB8FNo8uodWMcpp+aJv4iEKxwh
	6JBcv05QDOdnJPMu1aPmbobLAOzLEytPjnLc8qNSnNdGr6Bk95l04NqwAdiWv1r6iEmBEpmNUk/M0
	pWhbiB8lW7BQhhii+4hG2H3fZlQafgdugSaI0K1Kumd+usjFPDynPMuzPUOKOtGgv3DD+WDxLRTOU
	UFmWB+QcNe5q2bW1YDwQYgaz//gDgjYQ7AtNYEjVWd4GBWiUOGlQMARV3tHpX//64hvlhKV5ODiyO
	sL2U86SA==;
Received: from ip6-localhost ([::1]:43608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lD9vG-000jQ5-W2; Fri, 19 Feb 2021 17:50:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44015) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lD9vA-000jPy-Le
 for samba-technical@lists.samba.org; Fri, 19 Feb 2021 17:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M+W8DkF5+EZIcp0whyJp0l+5eP5fd9n9yf04AU6DPA=;
 b=NW/KCjDVdws5e40MRpfOL99cz1UZuRcUzDBrcBlZ/E0i5c7a+O8Zyvq6UDu/jqLRSqWyIm
 dAJgSyjh2Qk8hK8D1hbUsigwFhxhDxvXEBFAnSl2lXt0wHaiOlfqx1j6eOnHuzoNTp6alo
 Pe4RzAftjljYRktY1SjGc+qP4QdJNwE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M+W8DkF5+EZIcp0whyJp0l+5eP5fd9n9yf04AU6DPA=;
 b=V2XSAoX5yNATFoo+Y6H82ZM+uXh699wS1n40zWafTkIscoz8XSTVYdofuiDP+7JCcUMHKn
 rz1p5oMh+SMi4byAVBLLthUBwvOezZrXuADkTlTOzTFXacDYKo5dV4/vexh2GLzltSBUa2
 ++QIAvTk/LmAdQVyGDc9zmNMLZxcQG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-3yG3cfZtOPGTVul-7UEm6g-1; Fri, 19 Feb 2021 12:34:11 -0500
X-MC-Unique: 3yG3cfZtOPGTVul-7UEm6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B340801975;
 Fri, 19 Feb 2021 17:34:10 +0000 (UTC)
Received: from ovpn-113-105.phx2.redhat.com (ovpn-113-105.phx2.redhat.com
 [10.3.113.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 223465D9C2;
 Fri, 19 Feb 2021 17:34:09 +0000 (UTC)
Message-ID: <a061a4d4d3522f9aedfc46c71459206f67958211.camel@redhat.com>
Subject: Re: [gssproxy] Re: cifs-utils, Linux cifs kernel client and gssproxy
To: Shyam Prasad N <nspmangalore@gmail.com>, "Weiser, Michael"
 <michael.weiser@atos.net>
Date: Fri, 19 Feb 2021 12:34:08 -0500
In-Reply-To: <CANT5p=rOJO6s7Ro9bQG4DN70m-=Eb4Ax9A+jJe7oBdj9Xm_EYQ@mail.gmail.com>
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <e562d3fb430e4c87b0700a70267ef930@atos.net>
 <CANT5p=rOJO6s7Ro9bQG4DN70m-=Eb4Ax9A+jJe7oBdj9Xm_EYQ@mail.gmail.com>
Organization: Red Hat, Inc.
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <simo@redhat.com>
Cc: Steve French <smfrench@gmail.com>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-02-19 at 03:26 -0800, Shyam Prasad N wrote:
> Hi Michael,
> 
> What happens when credentials are not supplied in keytab files? Is
> there a way to supply the credentials from other sources in that case?
> The reason why I'm asking this is that this same code can be used by
> cifscreds (or a new executable) to perform the authentication, and
> collect the krb5 tickets.

Either a keytab or a ccache can be used. If a user is interactively no
the system and have created a ccache that can be used directly.

> Also, in the cifs.upcall changes, you could check for the
> GSS_USE_PROXY env variable. In the absence of which, fallback to the
> older code. If that is done, it gives the user an option to go for one
> option or the other.
> Other than that, the changes look fine to me.
> 
> Regards,
> Shyam
> 
> On Thu, Jan 7, 2021 at 3:08 AM Weiser, Michael <michael.weiser@atos.net> wrote:
> > Hello Simo,
> > Hello Steve,
> > 
> > > If something is needed in the short term, I thjink the quickest course
> > > of action is indeed to change the userspace helper to use gssapi
> > > function calls, so that they can be intercepted like we do for rpc.gssd
> > > (nfs client's userspace helper).
> > 
> > To get the ball rolling and give people (including myself and client) something to play with I went that route and extended cifs.upcall to fall back to GSS-API if no ticket cache nor keytab can be found for the user. An unpolished PoC patch is attached. (Sorry, for not putting it inline, have to rock the groupware at work. I will try to sort that once we've agreed this is the/a way to go.)
> > 
> > With that patch applied,  I can do a multiuser cifs mount using the system keytab and machine identity as usual and then have users access the mount using impersonated credentials from gssproxy. Quick demo:
> > 
> > [root@fedora33 ~]# umount /mnt
> > [root@fedora33 ~]# mount -o sec=krb5,multiuser,user=FEDORA33\$ //dc/share /mnt
> > [root@fedora33 ~]# ls -la /mnt
> > total 0
> > drwxr-xr-x.  2 root root   0 Jan  7 10:20 .
> > dr-xr-xr-x. 18 root root 238 Jan  6 13:59 ..
> > -rwxr-xr-x.  1 root root   0 Jan  5 17:02 bar
> > [root@fedora33 ~]# klist
> > klist: Credentials cache keyring 'persistent:0:krb_ccache_WZh7W8n' not found
> > [root@fedora33 ~]#
> > 
> > [adsuser@fedora33 ~]$ kdestroy
> > [adsuser@fedora33 ~]$ echo test > /mnt/test
> > [adsuser@fedora33 ~]$ cat /mnt/test
> > test
> > [adsuser@fedora33 ~]$ klist
> > klist: Credentials cache keyring 'persistent:1618201110:krb_ccache_SrGqT3F' not found
> > [adsuser@fedora33 ~]$
> > 
> > Server-side permissions are enforced:
> > 
> > [m@fedora33 ~]$ cat /mnt/test
> > test
> > [m@fedora33 ~]$ echo mytest > /mnt/test
> > -bash: /mnt/test: Permission denied
> > [m@fedora33 ~]$ klist
> > klist: Credentials cache keyring 'persistent:1000:1000' not found
> > [m@fedora33 ~]$
> > 
> > The gssproxy config for this configures a cifs-specific socket and enables impersonation for any user id:
> > 
> > [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> > [service/cifs]
> > mechs = krb5
> > socket = /var/lib/gssproxy/cifs.sock
> > cred_store = keytab:/etc/krb5.keytab
> > cred_usage = initiate
> > euid = 0
> > impersonate = yes
> > allow_any_uid = yes
> > 
> > And request-key config for cifs.spnego enables use of gssproxy and the service-specific socket through environment variables:
> > 
> > [root@fedora33 ~]# cat /etc/request-key.d/cifs.spnego.conf
> > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=yes GSSPROXY_SOCKET=/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall %k
> > 
> > (I see that nfs-utils' gssd does the same by setting the variables itself based on command line options. That could easily be done here as well.)
> > 
> > User FEDORA33$ (the computer object) needs to be enabled for delegation to service cifs. I've tested with a Fedora 33 client and Windows 2016 Active Directory server.
> > 
> > The patch is against current cifs-utils HEAD. It is lacking all the autoconf trimmings and intentionally forgoes reindents of existing code for clarity of what's being touched.
> > 
> > What do you think?
> > 
> > > Unfortunately I do not have the cycles to work on that myself at this
> > > time :-(
> > 
> > I have a client in very tangible need of this functionality who is a RedHat customer. Would it be helpful if they were to open a case with Redhat on this?
> > 
> > As an extension the above (but not to distract from the focus of getting something to work at all first):
> > 
> > I rather accidentally also played around with delegating retrieval of the mount credentials into gssproxy as well (due to not realising that username=FEDORA33$ would just activate the keytab codepath in cifs.upcall).
> > 
> > This can be done by leaving out the username from the mount command, marking euid 0 as trusted for access to the keytab in gssproxy and adding a fallback principal to the gssproxy config (because cifs.upcall in this case does not submit a desired name for the credential):
> > 
> > [root@fedora33 ~]# mount -o sec=krb5,multiuser //dc/share /mnt
> > [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> > [service/cifs]
> > mechs = krb5
> > socket = /var/lib/gssproxy/cifs.sock
> > cred_store = keytab:/etc/krb5.keytab
> > cred_usage = initiate
> > euid = 0
> > trusted = yes
> > impersonate = yes
> > krb5_principal = cifs-mount
> > allow_any_uid = yes
> > 
> > While this works, it requires a separate user who would then carefully need to be kept out of any sensitive file access groups.
> > 
> > When trying to use the machine identity FEDORA33$ instead, I ran into a peculiar error from the AD KDC:
> > 
> > [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> > [service/cifs]
> > mechs = krb5
> > socket = /var/lib/gssproxy/cifs.sock
> > cred_store = keytab:/etc/krb5.keytab
> > cred_usage = initiate
> > euid = 0
> > trusted = yes
> > impersonate = yes
> > krb5_principal = FEDORA33$
> > allow_any_uid = yes
> > [root@fedora33 ~]# gssproxy -i -d &
> > [2] 3814
> > [root@fedora33 ~]# [2021/01/07 10:01:10]: Debug Enabled (level: 1)
> > [2021/01/07 10:01:10]: Service: nfs-server, Keytab: /etc/krb5.keytab, Enctype: 17
> > [2021/01/07 10:01:10]: Service: cifs, Keytab: /etc/krb5.keytab, Enctype: 17
> > [2021/01/07 10:01:10]: Service: nfs-client, Keytab: /etc/krb5.keytab, Enctype: 17
> > [2021/01/07 10:01:10]: Client [2021/01/07 10:01:10]: (/usr/sbin/gssproxy) [2021/01/07 10:01:10]:  connected (fd = 11)[2021/01/07 10:01:10]:  (pid = 3814) (uid = 0) (gid = 0)[2021/01/07 10:01:10]:  (context = system_u:system_r:kernel_t:s0)[2021/01/07 10:01:10]:
> > 
> > [root@fedora33 ~]# mount -o sec=krb5,multiuser //dc/share /mnt
> > [2021/01/07 10:01:13]: Client [2021/01/07 10:01:13]: (/usr/sbin/cifs.upcall) [2021/01/07 10:01:13]:  connected (fd = 12)[2021/01/07 10:01:13]:  (pid = 3824) (uid = 0) (gid = 0)[2021/01/07 10:01:13]:  (context = system_u:system_r:kernel_t:s0)[2021/01/07 10:01:13]:
> > [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 6 (GSSX_ACQUIRE_CRED) for service "cifs", euid: 0,socket: /var/lib/gssproxy/cifs.sock
> > gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS failure.  Minor code may provide more information, KDC has no support for padata type
> > [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 8 (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 0,socket: /var/lib/gssproxy/cifs.sock
> > gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS failure.  Minor code may provide more information, KDC has no support for padata type
> > [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 6 (GSSX_ACQUIRE_CRED) for service "cifs", euid: 0,socket: /var/lib/gssproxy/cifs.sock
> > gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS failure.  Minor code may provide more information, KDC has no support for padata type
> > [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 8 (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 0,socket: /var/lib/gssproxy/cifs.sock
> > gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS failure.  Minor code may provide more information, KDC has no support for padata type
> > mount error(126): Required key not available
> > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and kernel log messages (dmesg)
> > 
> > With more debugging it appears that gssproxy tries to impersonate user FEDORA33$ with a credential which is also for FEDORA33$. After further testing it seems this is generally not allowed or just not working due to never being tested because it is unnecessary: If we can acquire a impersonation credential for that identity we should also be able to get the actual access credential as well.
> > 
> > From looking at the nfs-utils gssd code it appears the only reason it hasn't run into this case yet is because it handles the machine credentials itself using krb5 functions.
> > 
> > The second attached patch against current gssproxy HEAD adds that distinction and makes this case work as an optional extension with fallback into the default codepath on error.
> > 
> > Does that make sense?
> > Is it sane, security wise, do you think?
> > --
> > Thanks,
> > Michael
> > ________________________________________
> > From: Simo Sorce <simo@redhat.com>
> > Sent: 16 December 2020 15:31:40
> > To: The GSS-Proxy developers and users mailing list; linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Subject: [gssproxy] Re: cifs-utils, Linux cifs kernel client and gssproxy
> > 
> > Caution! External email. Do not open attachments or click links, unless this email comes from a known sender and you know the content is safe.
> > 
> > Hi Michael,
> > as you say the best course of action would be for cifs.ko to move to
> > use the RPC interface we defined for knfsd (with any extensions that
> > may  be needed), and we had discussions in the past with cifs upstream
> > developers about it. But nothing really materialized.
> > 
> > If something is needed in the short term, I thjink the quickest course
> > of action is indeed to change the userspace helper to use gssapi
> > function calls, so that they can be intercepted like we do for rpc.gssd
> > (nfs client's userspace helper).
> > 
> > Unfortunately I do not have the cycles to work on that myself at this
> > time :-(
> > 
> > HTH,
> > Simo.
> > 
> > On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > > Hello,
> > > 
> > > I have a use-case for authentication of Linux cifs client mounts without the user being present (e.g. from batch jobs) using gssproxy's impersonation feature with Kerberos Constrained Delegation similar to how it can be done for NFS[1].
> > > 
> > > My understanding is that currently neither the Linux cifs kernel client nor cifs-utils userland tools support acquiring credentials using gssproxy. The former uses a custom upcall interface to talk to cifs.spnego from cifs-utils. The latter then goes looking for Kerberos ticket caches using libkrb5 functions, not GSSAPI, which prevents gssproxy from interacting with it.[2]
> > > 
> > > From what I understand, the preferred method would be to switch the Linux kernel client upcall to the RPC protocol defined by gssproxy[3] (as has been done for the Linux kernel NFS server already replacing rpc.svcgssd[4]). The kernel could then, at least optionally, talk to gssproxy directly to try and obtain credentials.
> > > 
> > > Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI calls and provide them with the required credentials (similar to the NFS client rpc.gssd[5]).
> > > 
> > > Assuming my understanding is correct so far:
> > > 
> > > Is anyone doing any work on this and could use some help (testing, coding)?
> > > What would be expected complexity and possible roadblocks when trying to make a start at implementing this?
> > > Or is the idea moot due to some constraint or recent development I'm not aware of?
> > > 
> > > I have found a recent discussion of the topic on linux-cifs[6] which provided no definite answer though.
> > > 
> > > As a crude attempt at an explicit userspace workaround I tried but failed to trick smbclient into initialising a ticket cache using gssproxy for cifs.spnego to find later on.
> > > Is this something that could be implemented without too much redundant effort (or should already work, perhaps using a different tool)?
> > > 
> > > [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-impersonation-via-constrained-delegation
> > > [2] https://pagure.io/gssproxy/issue/56
> > > [3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumentation.md
> > > [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
> > > [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
> > > [6] https://www.spinics.net/lists/linux-cifs/msg20182.html
> > > --
> > > Thanks,
> > > Michael
> > > _______________________________________________
> > > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> > > To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> > > Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> > > List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> > > List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@lists.fedorahosted.org
> > 
> > --
> > Simo Sorce
> > RHEL Crypto Team
> > Red Hat, Inc
> > 
> > 
> > 
> > _______________________________________________
> > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.org
> > To unsubscribe send an email to gss-proxy-leave@lists.fedorahosted.org
> > Fedora Code of Conduct: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
> > List Guidelines: https://fedoraproject.org/wiki/Mailing_list_guidelines
> > List Archives: https://lists.fedorahosted.org/archives/list/gss-proxy@lists.fedorahosted.org
> 
> 

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc






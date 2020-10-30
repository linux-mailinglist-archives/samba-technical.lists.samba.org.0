Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77A29FB53
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 03:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=96nbCOKTq1q3+9TBUrwE9w9x8n+cA10FX/IHup1/DUw=; b=x3XJjCvCnWuzloRgAh1m4cwYBV
	vCyaJ6Zs6IvayNeQEKjk+fxx7Fy4oxLkmGN8Udf4uAvwcC0nDsP6Z/3SK6mhSdJKGqScxAG7mKDRH
	kEO7ERLjf6hS8S1svty7oEfIlXLDFL5Das1gcKCk8Q9WBV4p+6F+bAHGqeHXrtN1WCScWoamdxTHk
	yLReTGatgZg/Un5vQhQdTCuPn67MrUR01t9uaC1m/pp5U58NJz/dkrlnbUvk+ursJsQGtMgGrrBHq
	alF2NSYM0XxI5xHE9CS5av/DRXoyKwKyKA2jkbZcjrwdfUJnWX0iGxWbfT/kbTyg8Anc+pe5LLo6q
	xZAvTLaQ==;
Received: from ip6-localhost ([::1]:37836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYKC9-00EXQk-0j; Fri, 30 Oct 2020 02:31:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36108) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kYKC1-00EXQc-Fu
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 02:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604025062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96nbCOKTq1q3+9TBUrwE9w9x8n+cA10FX/IHup1/DUw=;
 b=BlqBSVvZ8Q0G+06azND2mTXNXe9LBbhgjrG4H+BUYH7g7OZ4b+0b6LBJNVRz1BFIQyAPpt
 t173WKMGRGUV6CxbaSTCBoPCAnV1maP8B4LDkuLnH9kO/o3KrhUjBWd4xrozSEkNH8JE81
 84XliO4cwwCnYLLs3KRcqucu+1OJdUs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604025062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96nbCOKTq1q3+9TBUrwE9w9x8n+cA10FX/IHup1/DUw=;
 b=BlqBSVvZ8Q0G+06azND2mTXNXe9LBbhgjrG4H+BUYH7g7OZ4b+0b6LBJNVRz1BFIQyAPpt
 t173WKMGRGUV6CxbaSTCBoPCAnV1maP8B4LDkuLnH9kO/o3KrhUjBWd4xrozSEkNH8JE81
 84XliO4cwwCnYLLs3KRcqucu+1OJdUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-hgHRumqyMPOmQ-HN8gPSMQ-1; Thu, 29 Oct 2020 22:14:29 -0400
X-MC-Unique: hgHRumqyMPOmQ-HN8gPSMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3068164149;
 Fri, 30 Oct 2020 02:14:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2827E5DA79;
 Fri, 30 Oct 2020 02:14:28 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
 (zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20F5A181A050;
 Fri, 30 Oct 2020 02:14:27 +0000 (UTC)
Date: Thu, 29 Oct 2020 22:14:27 -0400 (EDT)
To: belle@samba.org
Message-ID: <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
In-Reply-To: <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
Subject: Re: can't start smbd after install samba posix branch
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.14]
Thread-Topic: can't start smbd after install samba posix branch
Thread-Index: AdauDZ0CO0bxapYBSY2MFkNESAwnyk2qXy74
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xifeng@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
From: Xiaoli Feng via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xiaoli Feng <xifeng@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

After add NotifyAccess=all in Unit section. smbd still can't start.

Oct 29 22:11:30 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]: /usr/lib/systemd/system/smb.service:6: Unknown lvalue 'NotifyAccess' in section 'Unit'

smb.services:
# cat /usr/lib/systemd/system/smb.service
[Unit]
Description=Samba SMB Daemon
Documentation=man:smbd(8) man:samba(7) man:smb.conf(5)
Wants=network-online.target
After=network.target network-online.target nmb.service winbind.service
NotifyAccess=all

[Service]
Type=notify
NotifyAccess=all
PIDFile=/run/smbd.pid
LimitNOFILE=16384
EnvironmentFile=-/etc/sysconfig/samba
ExecStart=/usr/local/samba/sbin/smbd --foreground --no-process-group $SMBDOPTIONS
ExecReload=/bin/kill -HUP $MAINPID
LimitCORE=infinity
Environment=KRB5CCNAME=FILE:/run/samba/krb5cc_samba

[Install]
WantedBy=multi-user.target



----- Original Message -----
> From: "L. van Belle" <belle@samba.org>
> To: "Xiaoli Feng" <xifeng@redhat.com>
> Cc: samba-technical@lists.samba.org
> Sent: Friday, October 30, 2020 12:07:35 AM
> Subject: RE: can't start smbd after install samba posix branch
> 
> See: https://bugzilla.samba.org/show_bug.cgi?id=14552
> 
> This might help, quick test is
> 
> systemctl edit smbd
> Add
> 
> [Unit]
> NotifyAccess=all
> 
> 
> Greetz,
> 
> Louis
> 
> 
> 
> > -----Oorspronkelijk bericht-----
> > Van: samba-technical
> > [mailto:samba-technical-bounces@lists.samba.org] Namens
> > Xiaoli Feng via samba-technical
> > Verzonden: donderdag 29 oktober 2020 16:43
> > Aan: samba-technical; CIFS
> > CC: jra@samba.org; Ronnie Sahlberg
> > Onderwerp: can't start smbd after install samba posix branch
> > 
> > Hello folks,
> > 
> > I try to install samba posix branch in RHEL8. But failed to
> > start smbd daemon.
> > Does anyone know the reason? or what else do I miss?
> > 
> > #git clone git://git.samba.org/jra/samba
> > #git check -b posix remotes/origin/master-smb2
> > #./configure --prefix=/usr --enable-fhs
> > #make -j6
> > #make install
> > #smbd -D
> > # echo $?
> > 1
> > # smbd -D -d 10
> > INFO: Current debug levels:
> >   all: 10
> >   tdb: 10
> >   printdrivers: 10
> >   lanman: 10
> >   smb: 10
> >   rpc_parse: 10
> >   rpc_srv: 10
> >   rpc_cli: 10
> >   passdb: 10
> >   sam: 10
> >   auth: 10
> >   winbind: 10
> >   vfs: 10
> >   idmap: 10
> >   quota: 10
> >   acls: 10
> >   locking: 10
> >   msdfs: 10
> >   dmapi: 10
> >   registry: 10
> >   scavenger: 10
> >   dns: 10
> >   ldb: 10
> >   tevent: 10
> >   auth_audit: 10
> >   auth_json_audit: 10
> >   kerberos: 10
> >   drs_repl: 10
> >   smb2: 10
> >   smb2_credits: 10
> >   dsdb_audit: 10
> >   dsdb_json_audit: 10
> >   dsdb_password_audit: 10
> >   dsdb_password_json_audit: 10
> >   dsdb_transaction_audit: 10
> >   dsdb_transaction_json_audit: 10
> >   dsdb_group_audit: 10
> >   dsdb_group_json_audit: 10
> > [root@hp-dl360g9-12 ~]# echo $?
> > 1
> > 
> > I don't find any usefull log. Then I use systemd to start
> > smbd services. Show this error:
> > -- Unit smb.service has begun starting up.
> > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > systemd[1]: smb.service: Main process exited, code=exited,
> > status=1/FAILURE
> > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > systemd[1]: smb.service: Failed with result 'exit-code'.
> > -- Subject: Unit failed
> > -- Defined-By: systemd
> > -- Support: https://access.redhat.com/support
> > --
> > -- The unit smb.service has entered the 'failed' state with
> > result 'exit-code'.
> > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > systemd[1]: Failed to start Samba SMB Daemon.
> > -- Subject: Unit smb.service has failed
> > 
> > 
> > 
> > Thanks.
> > 
> > 
> > 
> > 
> > 
> 
> 



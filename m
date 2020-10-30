Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BE29FDC4
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 07:21:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z0CBN+wthUnYYdSMOLMWk3E9/iQO8xuRy79jGCqN8j0=; b=f51kWwhZlycEC6ifcGxCP7lfeE
	ds63Zjepq7eVqanmEJoGWZFza2S2mV0j9HeamJePJAuxNy7VhZKyZYoZjrBHql2Pa+7llT87I9bMG
	C+ShNjSMf7NESY1x3JdsRVSowqwhsZ7ChhdoxpaiRV5JMDqzChEOjFpKs3W1XaoJbwhahhIqA3dRs
	gbekXByBsuT0lob5P6knghAtgHNifFVGLZptPzNyM9YbMtpXCR9rR9VB2cXgAFQxAer43Jy4a/e8r
	TAHSnc61meeemw1FjHCC03aH0BozOMHHOEeE722Bugol7f+xJAnEX8P2Y357ggfjGZGXAYw6I+7SU
	bkneARfQ==;
Received: from ip6-localhost ([::1]:48480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYNmQ-00EZwJ-Ua; Fri, 30 Oct 2020 06:20:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49124) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kYNmK-00EZwC-N6
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 06:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604038837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0CBN+wthUnYYdSMOLMWk3E9/iQO8xuRy79jGCqN8j0=;
 b=BLcd9cxSshj6s1TZkr7ksPaTvXw+J0P9F30cQFsxL9rVlCKh0ybBmjAAG9lFea7nY5X+Iy
 PlkWaE7x7gwl8HNOetbT1FHyrOzcv3oATaul95HubiPYXw8IY22ULIWta2phBVB3tRvXRs
 sRkwFLkgkYXfapGDTWF0u5tKLcwwCTQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604038838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0CBN+wthUnYYdSMOLMWk3E9/iQO8xuRy79jGCqN8j0=;
 b=iqY5eRJeXegItln1/f9NB17KeABjRjnY1IOg9vRz8HNZF3S4vsXeMaH36A3I9df7QGYsz7
 yr4j9saHoD74dQHrRy6Ryb3bRX7RUjGdkLFvXQv5I1kAZ4Yis+4h6Et39tHLsbCE0IXnDc
 goG7umK3EMHM3WJjFHZ9Etry9mGSTY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-mojHLUL1PzqWiova67QXwA-1; Fri, 30 Oct 2020 02:20:34 -0400
X-MC-Unique: mojHLUL1PzqWiova67QXwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26EC1891E83;
 Fri, 30 Oct 2020 06:20:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F966EF40;
 Fri, 30 Oct 2020 06:20:32 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
 (zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8474158100;
 Fri, 30 Oct 2020 06:20:32 +0000 (UTC)
Date: Fri, 30 Oct 2020 02:20:31 -0400 (EDT)
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Message-ID: <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.10]
Thread-Topic: can't start smbd after install samba posix branch
Thread-Index: eyKFnPP22I5pXbGbUCp2AdcLzXaq9Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: samba-technical@lists.samba.org, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

----- Original Message -----
> From: "ronnie sahlberg via samba-technical" <samba-technical@lists.samba.org>
> To: "Xiaoli Feng" <xifeng@redhat.com>
> Cc: samba-technical@lists.samba.org, belle@samba.org
> Sent: Friday, October 30, 2020 10:49:52 AM
> Subject: Re: can't start smbd after install samba posix branch
> 
> What happens if you try to run it manually?

There isn't error log output. Just know the exit code is 1.

# smbd -D -d 10
INFO: Current debug levels:
  all: 10
  tdb: 10
  printdrivers: 10
  lanman: 10
  smb: 10
  rpc_parse: 10
  rpc_srv: 10
  rpc_cli: 10
  passdb: 10
  sam: 10
  auth: 10
  winbind: 10
  vfs: 10
  idmap: 10
  quota: 10
  acls: 10
  locking: 10
  msdfs: 10
  dmapi: 10
  registry: 10
  scavenger: 10
  dns: 10
  ldb: 10
  tevent: 10
  auth_audit: 10
  auth_json_audit: 10
  kerberos: 10
  drs_repl: 10
  smb2: 10
  smb2_credits: 10
  dsdb_audit: 10
  dsdb_json_audit: 10
  dsdb_password_audit: 10
  dsdb_password_json_audit: 10
  dsdb_transaction_audit: 10
  dsdb_transaction_json_audit: 10
  dsdb_group_audit: 10
  dsdb_group_json_audit: 10
# ps -ef |grep smbd
root       14630    2703  0 02:19 pts/0    00:00:00 grep --color=auto smbd
#

> 
> On Fri, Oct 30, 2020 at 12:32 PM Xiaoli Feng via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Hi,
> >
> > After add NotifyAccess=all in Unit section. smbd still can't start.
> >
> > Oct 29 22:11:30 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]:
> > /usr/lib/systemd/system/smb.service:6: Unknown lvalue 'NotifyAccess' in
> > section 'Unit'
> >
> > smb.services:
> > # cat /usr/lib/systemd/system/smb.service
> > [Unit]
> > Description=Samba SMB Daemon
> > Documentation=man:smbd(8) man:samba(7) man:smb.conf(5)
> > Wants=network-online.target
> > After=network.target network-online.target nmb.service winbind.service
> > NotifyAccess=all
> >
> > [Service]
> > Type=notify
> > NotifyAccess=all
> > PIDFile=/run/smbd.pid
> > LimitNOFILE=16384
> > EnvironmentFile=-/etc/sysconfig/samba
> > ExecStart=/usr/local/samba/sbin/smbd --foreground --no-process-group
> > $SMBDOPTIONS
> > ExecReload=/bin/kill -HUP $MAINPID
> > LimitCORE=infinity
> > Environment=KRB5CCNAME=FILE:/run/samba/krb5cc_samba
> >
> > [Install]
> > WantedBy=multi-user.target
> >
> >
> >
> > ----- Original Message -----
> > > From: "L. van Belle" <belle@samba.org>
> > > To: "Xiaoli Feng" <xifeng@redhat.com>
> > > Cc: samba-technical@lists.samba.org
> > > Sent: Friday, October 30, 2020 12:07:35 AM
> > > Subject: RE: can't start smbd after install samba posix branch
> > >
> > > See: https://bugzilla.samba.org/show_bug.cgi?id=14552
> > >
> > > This might help, quick test is
> > >
> > > systemctl edit smbd
> > > Add
> > >
> > > [Unit]
> > > NotifyAccess=all
> > >
> > >
> > > Greetz,
> > >
> > > Louis
> > >
> > >
> > >
> > > > -----Oorspronkelijk bericht-----
> > > > Van: samba-technical
> > > > [mailto:samba-technical-bounces@lists.samba.org] Namens
> > > > Xiaoli Feng via samba-technical
> > > > Verzonden: donderdag 29 oktober 2020 16:43
> > > > Aan: samba-technical; CIFS
> > > > CC: jra@samba.org; Ronnie Sahlberg
> > > > Onderwerp: can't start smbd after install samba posix branch
> > > >
> > > > Hello folks,
> > > >
> > > > I try to install samba posix branch in RHEL8. But failed to
> > > > start smbd daemon.
> > > > Does anyone know the reason? or what else do I miss?
> > > >
> > > > #git clone git://git.samba.org/jra/samba
> > > > #git check -b posix remotes/origin/master-smb2
> > > > #./configure --prefix=/usr --enable-fhs
> > > > #make -j6
> > > > #make install
> > > > #smbd -D
> > > > # echo $?
> > > > 1
> > > > # smbd -D -d 10
> > > > INFO: Current debug levels:
> > > >   all: 10
> > > >   tdb: 10
> > > >   printdrivers: 10
> > > >   lanman: 10
> > > >   smb: 10
> > > >   rpc_parse: 10
> > > >   rpc_srv: 10
> > > >   rpc_cli: 10
> > > >   passdb: 10
> > > >   sam: 10
> > > >   auth: 10
> > > >   winbind: 10
> > > >   vfs: 10
> > > >   idmap: 10
> > > >   quota: 10
> > > >   acls: 10
> > > >   locking: 10
> > > >   msdfs: 10
> > > >   dmapi: 10
> > > >   registry: 10
> > > >   scavenger: 10
> > > >   dns: 10
> > > >   ldb: 10
> > > >   tevent: 10
> > > >   auth_audit: 10
> > > >   auth_json_audit: 10
> > > >   kerberos: 10
> > > >   drs_repl: 10
> > > >   smb2: 10
> > > >   smb2_credits: 10
> > > >   dsdb_audit: 10
> > > >   dsdb_json_audit: 10
> > > >   dsdb_password_audit: 10
> > > >   dsdb_password_json_audit: 10
> > > >   dsdb_transaction_audit: 10
> > > >   dsdb_transaction_json_audit: 10
> > > >   dsdb_group_audit: 10
> > > >   dsdb_group_json_audit: 10
> > > > [root@hp-dl360g9-12 ~]# echo $?
> > > > 1
> > > >
> > > > I don't find any usefull log. Then I use systemd to start
> > > > smbd services. Show this error:
> > > > -- Unit smb.service has begun starting up.
> > > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > > systemd[1]: smb.service: Main process exited, code=exited,
> > > > status=1/FAILURE
> > > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > > systemd[1]: smb.service: Failed with result 'exit-code'.
> > > > -- Subject: Unit failed
> > > > -- Defined-By: systemd
> > > > -- Support: https://access.redhat.com/support
> > > > --
> > > > -- The unit smb.service has entered the 'failed' state with
> > > > result 'exit-code'.
> > > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > > systemd[1]: Failed to start Samba SMB Daemon.
> > > > -- Subject: Unit smb.service has failed
> > > >
> > > >
> > > >
> > > > Thanks.
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> >
> >
> 
> 



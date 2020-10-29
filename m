Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14C29F0AE
	for <lists+samba-technical@lfdr.de>; Thu, 29 Oct 2020 17:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YaXyyA+3brfqc67uOQpcnXMgyyRvDxRCA0pUcywHw6k=; b=FG3uAcwNXzI5/Z3dL8aFBOo2ST
	53uvzLnBy+N7tPM1Bw0BDi/nEOQSrNr4CDJptBfg0c3ixE7/ECc5AWZjbHTl1CQTrXI/db5neJ3+1
	t/kJaJR7ISNegEPQt7+yKC7UFl0rKpKAvfsPo/nOieKXlyRRVTgDU7KAH/SBRfZOTdcTc2SJDkFSZ
	upKkp7rzLm5ZUWSp7213TYe6L45IL7gtsgzhE81gProfDHN6yU68cXDYrWYLyDVb7pe8e5fJpko6B
	QWZjF89W4OavL+I1sejz1Lp82y2rp+8t7rD1n5eVjstDzw1iNf2p9TF2ysVZBuuwET9lfr1PxHONQ
	z8sg2Z3w==;
Received: from ip6-localhost ([::1]:46708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYAKh-00EPb5-IG; Thu, 29 Oct 2020 15:59:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36903) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kYAKb-00EPay-8m
 for samba-technical@lists.samba.org; Thu, 29 Oct 2020 15:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603987153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=YaXyyA+3brfqc67uOQpcnXMgyyRvDxRCA0pUcywHw6k=;
 b=D98cmzqVThLDoW+ktX4EhivpFA5ez+DFeC+PSRzRGo2W6/vlv5YXrgd1Qh1divpr6tQLEd
 ByeglIuiQ7S04H0i8S7oWGQQRuUi/heC/C0eSTZOaldcrKUPaoviFsIYnMkqC0rBf8hk7j
 Sf7kapjm9pBFxvc7h4HQK4IEDlk/Iho=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603987153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=YaXyyA+3brfqc67uOQpcnXMgyyRvDxRCA0pUcywHw6k=;
 b=D98cmzqVThLDoW+ktX4EhivpFA5ez+DFeC+PSRzRGo2W6/vlv5YXrgd1Qh1divpr6tQLEd
 ByeglIuiQ7S04H0i8S7oWGQQRuUi/heC/C0eSTZOaldcrKUPaoviFsIYnMkqC0rBf8hk7j
 Sf7kapjm9pBFxvc7h4HQK4IEDlk/Iho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-wH1PFSzwNku7SY1hQxDGYw-1; Thu, 29 Oct 2020 11:43:25 -0400
X-MC-Unique: wH1PFSzwNku7SY1hQxDGYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B79C21009E47;
 Thu, 29 Oct 2020 15:43:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3035E9D0;
 Thu, 29 Oct 2020 15:43:23 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
 (zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F027181A86E;
 Thu, 29 Oct 2020 15:43:23 +0000 (UTC)
Date: Thu, 29 Oct 2020 11:43:23 -0400 (EDT)
To: samba-technical <samba-technical@lists.samba.org>, 
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
In-Reply-To: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
Subject: can't start smbd after install samba posix branch
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.68.5.20, 10.4.195.28]
Thread-Topic: can't start smbd after install samba posix branch
Thread-Index: 5T2Pn1PSLXHmz+QEHgU8A/mvgWMIMQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: jra@samba.org, Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello folks,

I try to install samba posix branch in RHEL8. But failed to start smbd daemon.
Does anyone know the reason? or what else do I miss?

#git clone git://git.samba.org/jra/samba
#git check -b posix remotes/origin/master-smb2
#./configure --prefix=/usr --enable-fhs
#make -j6
#make install
#smbd -D
# echo $?
1
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
[root@hp-dl360g9-12 ~]# echo $?
1

I don't find any usefull log. Then I use systemd to start smbd services. Show this error:
-- Unit smb.service has begun starting up.
Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]: smb.service: Main process exited, code=exited, status=1/FAILURE
Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]: smb.service: Failed with result 'exit-code'.
-- Subject: Unit failed
-- Defined-By: systemd
-- Support: https://access.redhat.com/support
-- 
-- The unit smb.service has entered the 'failed' state with result 'exit-code'.
Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]: Failed to start Samba SMB Daemon.
-- Subject: Unit smb.service has failed



Thanks.





Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD154F47DD
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 01:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cAYTvVkQXwgb/Ycl+rD8KnGxAkfTdeEsuwq0zIRSKLc=; b=VCQ9ntGODAezQoPlXzPWBRBIJm
	c/LwXzigcvWjueeLoSNyS9fjDitgkKmwSJMlvT+FSzOCxM9fclbzugyDHBI3uU0BpOFtteJuX2JZM
	Dj/v2iga2WwuFSmT/crqc8buqHSNjecwoWUWtV/ObSKH48rzX1t+Est6pRQQ7856xdznq0MJyfCBi
	ZFgiRjvFKaCZZ6mgzvWILy2p6O4zxVYjdqFBWSeqNdLF8VlAJxK8AQ6FkFLKXmhkG3lQQDW8F+4FX
	A2YspwmtVn/pGDcUjrRPFhUUOpCWKd5a4wsKdHw6Bw28NyUozKE73uhDuzqqWBbJVfXjN28LBPg5b
	YKqgr7AA==;
Received: from ip6-localhost ([::1]:45380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbspU-00AGQM-Tq; Tue, 05 Apr 2022 23:43:20 +0000
Received: from ext140.multitalents.net ([173.164.249.140]:60979
 helo=server01.int.multitalents.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nbspP-00AGQD-5L
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 23:43:18 +0000
Received: from server01.int.multitalents.net (localhost [127.0.0.1])
 by server01.int.multitalents.net (8.15.2/8.13.8) with ESMTP id 235Nh8mb029579
 for <samba-technical@lists.samba.org>; Tue, 5 Apr 2022 16:43:08 -0700 (PDT)
Received: from localhost (tim@localhost)
 by server01.int.multitalents.net (8.15.2/8.13.8/Submit) with ESMTP id
 235Nh8Yk029520
 for <samba-technical@lists.samba.org>; Tue, 5 Apr 2022 16:43:08 -0700 (PDT)
X-Authentication-Warning: server01.int.multitalents.net: tim owned process
 doing -bs
Date: Tue, 5 Apr 2022 16:43:07 -0700 (PDT)
X-X-Sender: tim@server01.int.multitalents.net
To: samba-technical@lists.samba.org
Subject: What determines RUNPATH in installed libs?
Message-ID: <alpine.UW2.2.11.2204051626590.10912@server01.int.multitalents.net>
User-Agent: Alpine 2.11 (UW2 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
From: Tim Rice via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Tim Rice <tim@multitalents.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


If I configure samba-4.10.16 with these options,
	--libdir=/opt/lib/samba
	--with-modulesdir=/opt/lib/samba
	--with-privatelibdir=/opt/lib/samba/private
most libs will get installed with the correct RUNPATH but these
    bin/default/lib/util/libsamba-modules-samba4.inst.so
    bin/default/libcli/registry/libutil-reg-samba4.inst.so
    bin/default/libcli/util/python-ntstatus.inst.cpython-39.so
    bin/default/libcli/util/python-werror.inst.cpython-39.so
    bin/default/source3/libmessages-util-samba4.inst.so
    bin/default/source3/libsmbldap.inst.so
    bin/default/source4/lib/samba3/libsmbpasswdparser-samba4.inst.so
    bin/default/nsswitch/stress-nss-libwbclient.inst
    bin/default/source3/smbd/notifyd/notifyd-tests.inst
    bin/default/source3/versiontest.inst
will get installed with RUNPATH /opt/lib/samba and yet they all
need libs from /opt/lib/samba/private.

Are the dependencies listed somewhere in one of the files in the source tree?
Are they calculated at configure time?
Are they calculated at build time?
Any idea where I should look?

Thanks for your consideration.

-- 
Tim Rice				Multitalents
tim@multitalents.net




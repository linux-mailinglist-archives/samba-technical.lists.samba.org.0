Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69907A704F1
	for <lists+samba-technical@lfdr.de>; Tue, 25 Mar 2025 16:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=X96JKW3mhXXwg0lP4D0jRdBRmdQLoTqV6x4m7xh7QKs=; b=yccYZ9lMvk+vW4yrpd5WygPfw0
	IPITU9E4oizsPMpE7A3GCSMZEDf9h6hQOrD91k8/1r5Vwbv873a4uLElHvHyDg49cp1YLKOUma5nk
	1zAtcp0He1jrotvSEsq6DymuZMttkQ2/1d6cnT6iuZbfcDuVz7baKnxmUIKqSNg65B7qaap7Frn5n
	yIL4q0cv1P+LhZeYfDDYzQBnkqqEbEYT2z7nObOcQ+mobHwlnnMH+gfsiZ0VMwxp9y28OcCUqKQgH
	zgi4QGaz4vhBbVEnrnsq6utFj297r7FqMlNnsmln+P9nS9XMNb5D23AYiufvKp+MTNhYVTXrno9eS
	/mIrZ/9g==;
Received: from ip6-localhost ([::1]:30884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tx68z-00Gpsw-5Q; Tue, 25 Mar 2025 15:24:45 +0000
Received: from qs51p00im-qukt01080502.me.com ([17.57.155.23]:25697) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tx68v-00Gpsk-Cl
 for samba-technical@lists.samba.org; Tue, 25 Mar 2025 15:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
 bh=X96JKW3mhXXwg0lP4D0jRdBRmdQLoTqV6x4m7xh7QKs=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme;
 b=NEeItWWa6EW7iG9/iYxamZ0D91A9yXFb2kkBa10quawW/aK7nGQ8rSjzK6ZKzng9m
 koYY6xPoYVneWFgAIAp8ix1jZ93xcv1eci7tGeFVi9gEGd/iSRsYuQp9U0b6xttMyY
 UqY72z6IHaGNjeY1+U5CslDv+W8w4Vdphma3nkx1XmyhrGJDGaITWJSdWtMKp60eeR
 +n75Iy43mtN/9orvjKYNZHdPXi0h2IGUYtldIez2wzxdCvJA+5AD6sI4ytuKgy55oV
 pc0utscs/NXJVOTPCEIrzf/Ma77z6+COcfPGTdqVJQ8YtupbddmVa5ma/5NZexP0hZ
 o044A5iK8ydkQ==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01080502.me.com (Postfix) with ESMTPSA id 6F1334E405EF
 for <samba-technical@lists.samba.org>; Tue, 25 Mar 2025 15:24:24 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Spotlight Mac with elastic and fscrawler
Message-Id: <59ACA520-F1B4-4CF9-AC2F-F21AE2ADE31F@mac.com>
Date: Tue, 25 Mar 2025 16:24:22 +0100
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Proofpoint-GUID: WBgORM83sdNfWB9v3pzgTom7RYbwFDJh
X-Proofpoint-ORIG-GUID: WBgORM83sdNfWB9v3pzgTom7RYbwFDJh
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
From: florent dony via samba-technical <samba-technical@lists.samba.org>
Reply-To: florent dony <florentdony@mac.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

I =E2=80=98m running a fedora 41 server. Clients on macOS want searching =
on smb share from fedora

Elasticserach and FSCrawler are running without errors

Samba is like this:

https://wiki.samba.org/index.php/Spotlight_with_Elasticsearch_Backend

However no results when searching an expression in spotlight with Mac

Thanks very much=


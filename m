Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F391787B5
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 02:47:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ARiVq/5f9Bs9V0+lnxVKbNzTc5VGuBH2A+kjQq32Zbw=; b=GcKPI5Che7PRpiloV1UT3NSGuC
	9Xvvu4W4Td8Q9sHBpbzs0o/EDfPt2EnRCt76QMmk3w4stL8XSyhDexoaGUvKOtkGSmVN64SlJcHaQ
	cn6OOMMht6hd0QgqRXAGj8UY1w4P/CtAy8Y9Y0ak3wVfsoQZ7EifFxiDJtJKEtEOlXIg0vv8lwfDc
	bREMHQicP8FewyvlQy8pAi6dQv+3tXUR/maCACY7YWkj4ZNwzoGDaT8KjJkZEn5CESnTe0BYO++j5
	2nYTCyp94jQ+bBsewxBsUgSAgclCwBZZpsw0psffMxdypSyG/rr6Nk4Q7t+RDgDzdF0DVxYHWLaRT
	8wjSorRA==;
Received: from localhost ([::1]:62716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9J87-00ErAd-SL; Wed, 04 Mar 2020 01:47:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61268) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9J80-00ErAW-DO
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 01:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ARiVq/5f9Bs9V0+lnxVKbNzTc5VGuBH2A+kjQq32Zbw=; b=GDM6RIIKCFGpa0WAaSQpHfQQ+S
 AdL4BPDvqlGI9YcODrqs9sgQ8Kt02W1/ExSvIlrd6mwy/qi+P/G9T7Wz4HxLbptElvStBUblmHt2g
 HQwPQ+ay8yHqmW3X4BwM6IYDkZNTX05m/nHoYz8BQ4novRZ1DKe9iZSXBo4svnQr+Ks3vfduhqKCh
 FXTD4P6cL6RZdnINw340b2dnznyT26zZVwh4KuZHKKcDeZlFpMGrRO6bO9u27wcPNWemgZy7qKvvJ
 TlGz2vBEWDXClNJDpXDmxCniUW26Hrizjh1pp2pUP9BSWCFrmED6s8COsd2ReoYdmPg2HorkmtT9o
 WfYttcaw+ac23W/eOKFp9J6RckH8nVmQp+vZSRcwInmnXfrHiglhmhiCcuXAdDn8UCHvHlE5vMGjS
 Hsm86K6XlPR7bwLclnCHAQzRBDZHLRYpKztSsF2dQrflm8gmWPpHC3wj8J59OzO6WWeIMJU5FmUpJ
 LUrJ2kuvH099UPGg9J3AMOSm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9J7z-0002x9-3y
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 01:47:15 +0000
Message-ID: <83b3b489fe59f7a6b6c4528292ea7cbecd97dc21.camel@samba.org>
Subject: In-tree Crypto removal progress
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 04 Mar 2020 14:47:12 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

While checking on the previous thread I thought I would see where we
are at with being able to remove the in-tree AES code.

The blocking OS versions (missing the CFB8 and CMAC support) are:
 - Ubuntu 16.04
 - Ubuntu 18.04
 - Debian 9
 - Centos 7 (or build a newer compat library)

We should re-consider our minimum OS versions again 6 months time when
CentOS 7 will feel quite old and Ubuntu 20.20 is likely to be both well
accepted and hopefully installed on sn-devel.

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








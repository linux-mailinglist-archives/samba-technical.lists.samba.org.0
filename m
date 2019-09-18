Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EACEAB6F8A
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 01:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0FXBkOxksaHoMLHX4FjYXHlNot8zBDrieNy73tl2mNk=; b=DvD/1lFre1iK3Vs6nsyoHWCOjK
	v2c7txJikJVbfjUznBw8IlQ4kjASyiw0oEVPWfpINqYGxvcodd82BIeJbR6uxQ/CSFZc4VaDorQtK
	l/xejgQKcOj6V7YDviNyDKGJ3+6Q8CPYItrfltkoYNFvGbLH7PW8lVZ9IdYC3tJDn7Ki5DKCl8Z6W
	xe+sQ96F60FC/B91MoOQetu4YkH1rRgjh9UFs7MNH8HfCmwJDuxly1K9tVQlsRDizgYeN8Vi0cFkX
	jZWiRBMdbyRss9KPKRlTcdRseq6qjQvJdzDmC8f1P/g7NRpFZBy2q65Cvj250ns9d03hJJVTFQ1KC
	A0+FrbLg==;
Received: from localhost ([::1]:43124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAj2G-006iXX-EI; Wed, 18 Sep 2019 23:06:56 +0000
Received: from [110.5.45.10] (port=61785 helo=pandora7.parkway.co.jp) 
 by hr1.samba.org with esmtp (Exim) id 1iAj2C-006iXQ-4I
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 23:06:54 +0000
Received: from ns.ribbon.or.jp (unknown [192.168.3.11])
 by pandora7.parkway.co.jp (Postfix) with ESMTP id 2C201106B49D
 for <samba-technical@lists.samba.org>; Thu, 19 Sep 2019 07:59:37 +0900 (JST)
Received: by ns.ribbon.or.jp (Postfix, from userid 1001)
 id 9620D2FC32F; Thu, 19 Sep 2019 08:00:00 +0900 (JST)
Date: Thu, 19 Sep 2019 08:00:00 +0900
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [typo] vfs_ceph_snapshots.8.xml (4.11.0rc3)
Message-ID: <20190918230000.GA58117@ns.ribbon.or.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Warn: EHLO/HELO not verified: Remote host 110.5.45.10
 (aa045010.ppp.asahi-net.or.jp) incorrectly presented itself as
 pandora7.parkway.co.jp
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
From: Samba-JP oota via samba-technical <samba-technical@lists.samba.org>
Reply-To: Samba-JP oota <ribbon@samba.gr.jp>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

        <para>
                The <command>vfs_ceph_snapshots</command> VFS module exposes
                CephFS snapshots for use by Samba. When enabled, SMB clients
                such as Windows Explorer's Previous Versions dialog, can
                enumerate snaphots and access them via "timewarp" tokens.
                          snapshots
        </para>



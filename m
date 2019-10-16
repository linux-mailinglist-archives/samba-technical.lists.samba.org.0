Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14701D9C4D
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=d+Ysm+jyrNC1lniKfbvqDsEbq72HSSw3e1BvBRMGO6w=; b=WReBcCwY+j26/nYFWRRHdilr/d
	HVo94DXi59HyYzR89nGAMjUDx/9YUlZEOZTqBwTPBPcduq/yeGI2hsC7n73EqnYS+shoEubfmn10X
	8KGOHSnaK3Q1rm72VqicD6cdLoqfFWWYWXunOUaRfI9KP2B4LxGXDRF9/qpLWLGXIaDm//+etkRuF
	dMJvdbd3Nk51bty2C2WCO7ngl8WwZLnkHpCdc+iK/QBGDQ+5zf74tNz1gUXiKXuPh5Jt0oVxM2tKm
	SDMjBXT5vPcobrihCLJpmu/6W+hptDiG4KNr9vyrbDuDjOTRXKZRcpNdsaaI9dT5MqVxK8zrjE3X+
	33LEn6Rg==;
Received: from localhost ([::1]:45198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYw-004PP5-AL; Wed, 16 Oct 2019 21:10:30 +0000
Received: from [13.77.154.182] (port=37524 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYf-004PMb-CQ
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:17 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 9A19820B71C6; Wed, 16 Oct 2019 13:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A19820B71C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259129;
 bh=d+Ysm+jyrNC1lniKfbvqDsEbq72HSSw3e1BvBRMGO6w=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=HWdZcriUfiUZvg7neKyFFitW1RWYsRucNa0yUzPfWIJPuODaofcUyWqognnCc8neq
 9j/ZAE2BRNh1WKSsoSps4/W+JN5CLVvNgNg26rQk71x8NDQYe7AEkzt1aZ8VSmULaq
 lQNbLdRfQGlbU7rzTSP7+Z91VCxNeIE4jxdZ/AYs=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] cifs: smbd: Improve reliability on transport reconnect
Date: Wed, 16 Oct 2019 13:51:49 -0700
Message-Id: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

Long Li (7):
  cifs: Don't display RDMA transport on reconnect
  cifs: smbd: Invalidate and deregister memory registration on re-send
  cifs: smbd: Return -EINVAL when the number of iovs exceeds
    SMBDIRECT_MAX_SGE
  cifs: smbd: Add messages on RDMA session destroy and reconnection
  cifs: smbd: Return -ECONNABORTED when trasnport is not in connected
    state
  cifs: smbd: Only queue work for error recovery on memory registration
  cifs: smbd: Return -EAGAIN when transport is reconnecting

 fs/cifs/cifs_debug.c |  5 +++++
 fs/cifs/file.c       | 19 +++++++++++++++++--
 fs/cifs/smbdirect.c  | 36 +++++++++++++++++++++---------------
 fs/cifs/transport.c  |  7 +++++--
 4 files changed, 48 insertions(+), 19 deletions(-)

-- 
2.17.1



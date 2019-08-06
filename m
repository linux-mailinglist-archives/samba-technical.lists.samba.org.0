Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B320B8301C
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 12:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=usveu5+2ThTd3Pa3a/rNTk/AgClRVHCodZD8WTcrVbg=; b=OnufmYKxp30JAM6+LJOKuABHYQ
	eJDG3Z1+30BUFctYmAFZKp89P4UmgJC6+XiN+DpuPmYfTK16efEJ89BNzECavF9q/+lZN+zEozWcM
	iIrXe5hD04ZI/qEdXfjV5nlafwbiKeH3d73BTB/pN9B0KG6H0fM7ojuuIDVmt5AGrqmrzIjikTWqt
	maKav4/XbHNom6yXsVielhaMxbClEoKv68FGg3qHbTQdw6U26uKvQtkoVCbCJzDqo4sG8Fzat2vEe
	Vw2VgPP7KztqH7OV6yL9b8uKqJrb0zl52wGeUV4OagJa/QRNVZHpGyUK8p17Xp/zBdYBxJ3jT2soq
	KOfeO4xg==;
Received: from localhost ([::1]:34206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hux7q-004aeB-8s; Tue, 06 Aug 2019 10:55:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33266) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hux7l-004adv-PD
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 10:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=usveu5+2ThTd3Pa3a/rNTk/AgClRVHCodZD8WTcrVbg=; b=lw3I2DNXGWR2CcLwQCn/ip0L4n
 VhQZLeVCyaU+JqID31q3e2/uNcYFHgwT52rONnoYldzOZjAt5qiEoXoqXxWxBPbRvWwE3DpV+M+9L
 K6Hm9WuRvPmAajXNwBC3cvCXncvBKD8PK9FzHDXo+2cs3D+k0FGI19YFwVEg9piKQGk8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hux7l-00053J-E7
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 10:55:25 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Delaying 4.11.0rc2
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
Date: Tue, 6 Aug 2019 12:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.11.0rc2 will be delayed, because library releases are needed first.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


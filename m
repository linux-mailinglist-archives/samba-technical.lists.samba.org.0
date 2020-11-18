Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E92B7C44
	for <lists+samba-technical@lfdr.de>; Wed, 18 Nov 2020 12:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=X07qsLhWxC+psYztiHPal0BdWAwnEecWrcPcfwNV2TQ=; b=KFH/IHRhyJRkQSaHJfB+rO9GMc
	aEVhIPF+Y4xVCn5IznfUshN6y2LhwzzCRJWxPkeZIU4PL/yHYmkgJY9pAH5MswAY6PAU3MTU8Unal
	RH4cgqdHRLqiTsNrTR7LempotX0mG42UoGgiGzQuRkFu3ZzOsp8BxcS/r+/IbQropZLdQxsP6f8sg
	FWJ1VFwxNaNQtDwxIHrOnEG388hzkitlQbvD08yf8r6LMOPrphC+pVDXIqmEkc90KuoiVuw3py2n9
	EjldqMkzx5r3sRTknAgIORkJhBg78nK5tFnA5UMiW4uXQ5xHQnC9XwstIHi3MMXLZXMItJ0Gbmyo1
	Vih8l82Q==;
Received: from ip6-localhost ([::1]:22378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kfLTe-001oVb-0t; Wed, 18 Nov 2020 11:18:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41116) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kfLTT-001oVU-V8
 for samba-technical@lists.samba.org; Wed, 18 Nov 2020 11:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=X07qsLhWxC+psYztiHPal0BdWAwnEecWrcPcfwNV2TQ=; b=oLw4dU133n4+k+Os0dOyXg1frA
 deyOcwtxG2r0Vep0yY3khSmv4REY9qozGaASE2DfLdEoLYm/arWpil6s1v1SA60ZxDxTtVVfknKSU
 VJVify6uxBuh85hKArn0qtZiQoxdey1n47+RsKz5BjdKRtZESr6svuCSq+y5zBPmxD1NXcmae/kQo
 zplw6kjdkjLdyBu+aGSpCcNI8wuOcwJl8nznJ+cmK97R9VK7azJpDYiZGrCko5voQRiMG3V5uD8T7
 q8zduSgWPlvPXqgv0ortPSgmdtJyXvDxFkb0LR6MNYs5NsCWIn62ec+oe6I+qoEUZErpAMPnJ/600
 rtIYMlJ2F4aiFq5TMIFWb2butUZGISdOoKNBcatni+U3E62U+hgJt6UrVwTmMhS9cddDwYXoANyEA
 AQCwaNJLPARWk1hI2xgndgytSrjv5HFU/Fbnf3jtVlMa8KgsjnVsdQs3tHuFM1lq/ivnq6Ph6vAhp
 0LAnYAgi4epumaOGVODTvZ88;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kfLTJ-00054v-UN; Wed, 18 Nov 2020 11:17:58 +0000
Subject: Re: ctdb errors after update to 4.12.10-10
To: samba-technical@lists.samba.org,
 =?UTF-8?Q?Benedikt_Kale=c3=9f?= <benedikt.kaless@forumZFD.de>
References: <4694450d-bb2a-a3b2-85a9-0ffcd43be95f@forumZFD.de>
Organization: Samba Team
Message-ID: <6e723e7a-0e57-49f5-1ccc-0a01ca897f9d@samba.org>
Date: Wed, 18 Nov 2020 12:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4694450d-bb2a-a3b2-85a9-0ffcd43be95f@forumZFD.de>
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

Am 15.11.20 um 19:49 schrieb Benedikt Kaleß via samba-technical:
> Dear all,
> 
> we updated to 4.12.10-10 using the sernet packages.
> 
> After approx. 30 minutes I obtainted the following messages in syslog:
> 
> root@ctdb-ho-2:~# journalctl -f
> -- Logs begin at Wed 2020-11-11 08:53:27 CET. --
> Nov 13 13:00:18 ctdb-ho-2 smbd[30956]: [2020/11/13 13:00:18.616823,  0]
> ../../source3/smbd/close.c:1150(close_directory)
> Nov 13 13:00:18 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
> share mode lock for <dir>
> Nov 13 13:00:18 ctdb-ho-2 smbd[30956]: [2020/11/13 13:00:18.693375,  0]
> ../../source3/smbd/close.c:1150(close_directory)
> Nov 13 13:00:18 ctdb-ho-2 smbd[30956]:   close_directory: Could not get
> share mode lock for <dir>

this seems to be bug https://bugzilla.samba.org/show_bug.cgi?id=14566
which does not seem to be in Samba 4.13. So upgrading to 4.13 should help.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7B586B9
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 18:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8MKnwoyV8PLamNHOOPElEAgiS5vvpZf3AK5jJ8YKU1U=; b=TJaSMhI4BJXYH8HeEuKcDJNMgU
	ZwE7uUlmJdPWwzbr0N0VTVO0qGIwHoE2nqaZjAmDQhL9B4SH0uaUsqrTHQN9hZdeYeX54EamJ8Trj
	B4jPG/KtSCPZrZgpINoyIScqZnoxeoouvAlFCzWxEqK81vt/FsQirSVLCLkjzy4XAF1wV265AryzL
	EnQ4dpk06ilNIJEzEcymxmT7uWra/7vdJrVpYolq+QXWv5N6wIIQtypQha7jDrkmObm7mV5OsozVk
	TNO95/pnyL3QmcMIu54AsxPrORsqK61/46MSEdvhpXVhQPszJqSjHe3Rz9NZY8utCKFLaAGBrx9Xc
	ZHspf9yQ==;
Received: from localhost ([::1]:48898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgWyD-002DRg-54; Thu, 27 Jun 2019 16:09:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgWy9-002DRZ-6G
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 16:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:Cc:To:From;
 bh=8MKnwoyV8PLamNHOOPElEAgiS5vvpZf3AK5jJ8YKU1U=; b=Sx1X6Hsv20czVwVH2BqEltvQXL
 z13bK0MSIRhFxviC6Vl6jzOW/7I0ztq5PHpVvVe/lVNmd3v9A1jHJ5NZs+JvFzOXEri9lKrMs/Aq2
 xqjFMzVX3F69IfgriEMdMJelWBbvHke8ROOmJKqQZOCAaUBb7dgt5fPBcgLDfH9SGHMI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgWy8-0007N5-1A; Thu, 27 Jun 2019 16:09:52 +0000
Subject: Re: [RFC] Rename st_ex_btime in struct stat_ex to st_ex_crtime
To: Jeremy Allison <jra@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>,
 Stefan Metzmacher <metze@samba.org>, David Disseldorp <ddiss@samba.org>
References: <c055bdf9-0262-4228-f8c3-7bc3de750715@samba.org>
Message-ID: <36995cc6-de0f-d0bf-d183-d5893a26f139@samba.org>
Date: Thu, 27 Jun 2019 18:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c055bdf9-0262-4228-f8c3-7bc3de750715@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/27/19 4:47 PM, Ralph Boehme wrote:
> while working on the File-ID s

sorry for the noise, please ignore.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


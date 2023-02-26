Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BC6A2CF0
	for <lists+samba-technical@lfdr.de>; Sun, 26 Feb 2023 02:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QfkU/Qg4kCYhYUL3RB8slmigJP6bQ2tXbpTfbQE4juA=; b=Fykqj87YDn9DkIkwvsniDG4kTG
	1dtpg8G/lJLp1A15LsNGxjWvtCgpilUT4Q7l/oy5HkbaxbGBB6qTwKi2lDF0vFUS6EjzIXDdpEwBT
	iP2AFeA+kcd471QUByWjLUCEM2AmT75PzJQU8kfsrGib3eZNfKlfriOQZhU8+x1BwnHRqVdQAWqrT
	j+NLIK68q53k9mtUX3jcRGZDTzrTE8ToszQpJK0l4QEgL02oD56h+cDWLAJLYWDlOtEezXEb9vtYn
	RRBOx4fXtroiPSw8Vezq4M7oo8FMiRWwwj2wnoT0lVZcUqWoS0ysVi8cUEu0ebeaVvZBf92/hcRzo
	4m1UuLnw==;
Received: from ip6-localhost ([::1]:63936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pW5hd-00E4bo-4x; Sun, 26 Feb 2023 01:19:49 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:59192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pW5hX-00E4bf-LB
 for samba-technical@lists.samba.org; Sun, 26 Feb 2023 01:19:47 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 99DA2819DD; 
 Sun, 26 Feb 2023 14:19:32 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1677374373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfkU/Qg4kCYhYUL3RB8slmigJP6bQ2tXbpTfbQE4juA=;
 b=kcmfxIDVJqgMW72iau98jFMQ/1U7qKSMQ3JMPlvqmxmmP8l9OTlvtjqfq22ml0jNa6AJ2M
 ySLj5nZdy77+Y4xwQXBpz/ttWe/HzCk2s6zw+C0dV9hGg+jk9h5o15cE8cQjnAYDsS6v6Y
 T17WrJN5F/kTd+RFRqc5IzAJm2zu+ZRLqbMzverukFkITQm2NwEKY+VXxHKF3lAn14qBQw
 bl0rt6apeA+0m0VIQjfEjLT9EcaTekYW6zwLS7gMljWYLWA7VR0v9yddFXdpYPvUnWLW2f
 TQZYlKVxsivOupkzeieeWiI7lOFolqcIYze6JSCSas2Hlp87LAqlepbj0pNQ4Q==
Message-ID: <bb839d6c-cc00-555c-6628-925ef3c161ea@catalyst.net.nz>
Date: Sun, 26 Feb 2023 14:19:30 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: WHATSNEW: SMB Server performance improvements
Content-Language: en-GB
To: Stefan Metzmacher <metze@samba.org>, Jule Anger <janger@samba.org>
References: <1a67acae-62b7-f1be-a23f-d5acbc838fc0@samba.org>
In-Reply-To: <1a67acae-62b7-f1be-a23f-d5acbc838fc0@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 25/02/23 03:46, Stefan Metzmacher via samba-technical wrote:

> +caused performance regressions for meta data heavy workloads.

I think "metadata" should be one word. Otherwise good.

Douglas



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052F29560A
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 03:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eV7tsz86RjTf0zxnD6V9sYTUrsIDD5I/IBKpywLt0qo=; b=Vg3nvAdcqTTlW8Q70mOJ89V8L3
	YuSAvkk5SUqe95DuVixe94B4MqJvi5JunE49BT5dbhC+JpfcKnLYh/aI3Trzswg/q0N7KP25rKpV1
	eVUDiMKaKyP2jiqeY6a+3XQtnH5PpPDMAAFgvL+8ZYa6YLANmf5URUd2hC7NWXYQGAr6XQTiauJVZ
	1IaWmNXfhAqom3OpGhjL6LUtKozNObIhm4W7FgLs3cgPwl8vyuNzXHKS6yjJKhyCTXnNMaUXxG1J7
	9ZBxRq0S4hjglQtHDs3YgyhYLzNF61X3euPdZXE/JvFUuo/lkEFzd/w4fKP/prYjhSXn9zkOigU5U
	uDVH//rQ==;
Received: from ip6-localhost ([::1]:32544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVPLn-00DDW0-C8; Thu, 22 Oct 2020 01:25:07 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:38518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVPLi-00DDVq-5g
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 01:25:05 +0000
Received: from [IPv6:2404:130:0:1000:716d:eeb4:e0cd:40ea] (unknown
 [IPv6:2404:130:0:1000:716d:eeb4:e0cd:40ea])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 3160280AF9; 
 Thu, 22 Oct 2020 14:24:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1603329882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eV7tsz86RjTf0zxnD6V9sYTUrsIDD5I/IBKpywLt0qo=;
 b=EywFprtit6zncDJFJodvpWbS7NPE0PTMfdvPZiXj6T7+n+UNIH8UHQCVnw7gBX6CNCfAbp
 gnRljqXUHYsuKVmpHySpJPzr7+mLXTZ/ID0DmMCdoch01t1UhlnVRLJvxjaA+cP2nE7swm
 zmLZb3r6B61A3Zb0jX02qcDG7UDd4t6Iig7Er53hLgjvnsvXv6zjBFW36qGE7G1NL3nKn6
 TJ5TRHXF7jVG7ECowPmTQpxWqFWBGVY7KPlFoXCRTxvAHRaoGKXnqmYrSpE6MSi6d6sU90
 9z0zUVj6agLxMJr16bXahl7d+3gGka/tceyjtRIVvoWu84WRv7Dbltp/o1IB+g==
Subject: Re: issues with oss-fuzz and missing libraries (avahi-common)
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <6e676db2323a9f96443ab3cfc65a586413bc37ea.camel@samba.org>
Message-ID: <0c27772a-fbb5-246f-a282-c22a92660482@catalyst.net.nz>
Date: Thu, 22 Oct 2020 14:24:42 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e676db2323a9f96443ab3cfc65a586413bc37ea.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/10/20 1:41 pm, Andrew Bartlett via samba-technical wrote:

> 
> This isn't just for the coverage stuff - I've checked, and the impacted fuzzers just never successfully run, which is a big problem.

It seems they ran until 8 September, and haven't since 14 September.
These are the respective coverage logs:

https://oss-fuzz-build-logs.storage.googleapis.com/log-81c8b380-1ef8-427c-bcf7-7b4174f6e1b9.txt
https://oss-fuzz-build-logs.storage.googleapis.com/log-e44362c2-f168-4b6f-88ce-433b7f040937.txt

Douglas


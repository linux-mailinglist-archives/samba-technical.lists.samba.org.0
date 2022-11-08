Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2B621191
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 13:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6wl0DxMGlkqHY/o2YF7cdNbT7+o+wjQo3jpeMGEgIL0=; b=5I3j0aKu68q7kyFe2N+75/MNsz
	yP9kFiqnWagnbqpwKjidWLELXZqxIs4R/6EeDk1irR5vjL2rPw6iwWV6Eu5Zgnvf7qFA+dXtYkw1j
	EE9sgfTLBYHcS5rAU1dRjkX7+K9FoCZ7Y4iFInXp1tHsTuYQx7vUDaJFWyuhBV2WYX9XICZmqONk1
	tChIai8R79+QJZNJ4nPhWcsIs4lZU+OitcVeYWQKICb6FEfGU39q6gNRIuJhBu1QpwOhhTNdgS4kD
	PJWvAZJLAmk1udh39fxlZyIYpJ0rg7Y0PekQt3kSI5ezBljRk1e6FFte7WVH2br4IX0UfikiA7Ob/
	ajMRxA2w==;
Received: from ip6-localhost ([::1]:44574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osO9V-00BXjK-Qk; Tue, 08 Nov 2022 12:56:29 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:44377) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osO9P-00BXjB-8Y
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 12:56:27 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AC9C440112
 for <samba-technical@lists.samba.org>; Tue,  8 Nov 2022 15:56:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9444830C
 for <samba-technical@lists.samba.org>; Tue,  8 Nov 2022 15:56:25 +0300 (MSK)
Message-ID: <df789124-d596-cec3-1ca0-cdebf7b823da@msgid.tls.msk.ru>
Date: Tue, 8 Nov 2022 15:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba does not work with liburing 2.3
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
In-Reply-To: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

08.11.2022 13:25, Michael Tokarev via samba-technical wrote:
> FWIW, samba built against the relatively new liburing-2.3 does not
> work right, io_uring-enabled samba just times out in various i/o
> operations (eg from smbclient) when liburing used at compile time
> was 2.3. It works fine with liburing 2.2.

This turned out to be debian packaging issue, but it might affect
others too. liburing 2.3 breaks ABI by changing layout of the main
struct io_uring object in a significant way.

http://bugs.debian.org/1023654

/mjt


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC97739CD
	for <lists+samba-technical@lfdr.de>; Tue,  8 Aug 2023 12:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Hl9u76ttA9S0HwcfRolwbSZkwRBwgeuS60K2XvBSfXo=; b=xy07IIoIZfxeAo5xAmQmPe1Ln6
	ML3krlu0Oln0J9WzTujVAi7hqMLSuw4FC+Uhf+UOpk33Qsyjwt7nYv9k+tHMdDRaF+2KiZQN9SwNc
	k5fIIZCeO7lFPSZoitv9a6qveiqO2EhjZXhJliEyovs4/sjfLuYsptc6PIxjNEfOLJfWKEOzAFYCj
	Z0G2Hyu/GPyi7ZW51hQOqVx6gqUmSLqcCvA5Ba1ilHy2qN6XeUS1tymK5xSJCdNRCCO6h7kuc4MvU
	yf4mpikwCcvtH28117rwCY3ThB4+jCUvwXT7aL/4uvP+y2x2CxJPYELIFoMFDDaCCHI+LVzzysi2I
	qwG6hgfw==;
Received: from ip6-localhost ([::1]:20400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTKNI-00AmyH-GY; Tue, 08 Aug 2023 10:55:40 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:58425) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTKNB-00Amy7-LC
 for samba-technical@lists.samba.org; Tue, 08 Aug 2023 10:55:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6F2B118FBB;
 Tue,  8 Aug 2023 13:55:33 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3EC071C579;
 Tue,  8 Aug 2023 13:55:30 +0300 (MSK)
Message-ID: <fb06b043-e93e-537c-335f-33e2b86dd36d@tls.msk.ru>
Date: Tue, 8 Aug 2023 13:55:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Rust bindings for TDB
Content-Language: en-US
To: =?UTF-8?Q?Jelmer_Vernoo=c4=b3?= <jelmer@samba.org>,
 samba-technical@lists.samba.org
References: <79BC9465-F780-4944-B996-35D7974F0DA7@samba.org>
In-Reply-To: <79BC9465-F780-4944-B996-35D7974F0DA7@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

08.08.2023 13:43, Jelmer Vernooĳ via samba-technical пишет:
> I've created Rust bindings for TDB. Th. Rust crate can be found at https://crates.io/crates/trivialdb (TDB was already taken :-( ).

FWIW, it looks like tdb crate is an old name of tdb_cli,
now forgotten (there's no such crate in the author's repository
anymore). I wonder if there's a way to "clean up" ("unclaim")
this old name somehow..

/mjt


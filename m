Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7186131AF
	for <lists+samba-technical@lfdr.de>; Mon, 31 Oct 2022 09:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DWXbXlv8NKpAkSPuEudOVUBr9BdLMyCqmPgLoh0TNgQ=; b=zGJ/h8pA66bPqitKT9TjoW/3fJ
	GXDgVnYZz76yWvV8gFYW9Ptr9kHYTkHAnWPVz9ymv8d4s7Na0w9B5m9PGRrL34b4I+2mUD+7FckDl
	oWvzKbMHZS0CwxPtr6FJkCSCM4r3TTqY0kUZ+N9kWBJqdJ8RBvg/rFJo1dLBBk24FTuZhw88Z1FRg
	rJY62+oRdBOhLsb053XJE8slvDU6dN8h6Tng6Pu4NND1SlLTgMFfKtuU6aQhYmvTkMaa2ZjDf2nZx
	WST722L3pT+ISHf9e6pWDd9LkTItyxz2lJ/gao+E2vkZib0chRdDoer9G8NnTRa4K9yW6wduOFC0v
	f8+7anSw==;
Received: from ip6-localhost ([::1]:63704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opQ89-007R9s-M4; Mon, 31 Oct 2022 08:26:49 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:54491) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opQ82-007R9j-Vh
 for samba-technical@lists.samba.org; Mon, 31 Oct 2022 08:26:47 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 14DDF403EE
 for <samba-technical@lists.samba.org>; Mon, 31 Oct 2022 11:26:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0A18113A
 for <samba-technical@lists.samba.org>; Mon, 31 Oct 2022 11:26:44 +0300 (MSK)
Message-ID: <b72a0362-10b9-866f-031e-4263f05263b8@msgid.tls.msk.ru>
Date: Mon, 31 Oct 2022 11:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: garbage file in sources: source4/ntp_signd/ntp-dev-4.2.5p125.diff
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

As the git log says, it's been there since 2009.. Is it a time to delete it? :)

/mjt


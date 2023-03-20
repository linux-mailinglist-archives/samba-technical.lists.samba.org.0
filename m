Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A24736C0E83
	for <lists+samba-technical@lfdr.de>; Mon, 20 Mar 2023 11:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pn9SCNewUbwC89xHh0w6HY2lSCpsnSVKfCNY1XiSIuU=; b=IlqrrPq2Oba+02xEIu9iqgjpV1
	Ccdka68SzZ5D1jSJtYBLzEt09wD+SoiDh753BE2S9VbjvJkdi1RyFn5mXw1E8h+nHJB9K1F4ne1pF
	1hirOqQqSLWG+uU5QCYgJnzr0XoeGEa3zgs95MzIITDzDUeRqpltkiccjI63l+8GId6pLOa3EZiOV
	pMwIMlHi23u3LxFbTaVs0SQnDnd2Je4x5gC8V+HLhB0+MQDK+e2UMN9rmZXwLMKfSpMTezfMhPKIv
	6Hm2wlVqJzkBXid58BmNaXntOP5CGT5nGisy0pGkLReMLSfWdRug4W8bzAsuyAjkO2pME9i7r/fIc
	Qz34D0FQ==;
Received: from ip6-localhost ([::1]:55234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peCad-003XJw-4j; Mon, 20 Mar 2023 10:18:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peCaY-003XJn-LI
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 10:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=pn9SCNewUbwC89xHh0w6HY2lSCpsnSVKfCNY1XiSIuU=; b=0hJfwUU9kSmg3PxHG5eKOdbWtt
 +SECH5BJzoyTTvCKNodrtex0a+rJsVM0MKI4IW+EZWKw3vVY9V2PTcHmL54v629hlWfmyH9qCuVtO
 9pup9LMaTHjWPjQSyhOHjruhOn8F4EcMgbQUEMYoT4fGEUEgjz08m4ipm55WdRY//R3ZTWZvosv7M
 DeFGHT9FTRCRF/S0tbhSVcj/uPqTKP7uwpGMRA7ccXBHRC1zE+1VMJdsEo8u/y53kWoq1tCtt7yrW
 UhGF3b1W4JosalNUodDHlMMzjbpxrZ1GbVB/u2C9oGq8grtfumemIJIak1qSoLor0xiCP8PNpLuug
 X1aKSlFjnfeHqsy42CJbkJ9xaYWe2RpwNrnxS7kuBhlJl4rqCVFjIgO6rkyKa6BugSockNl2iBTgN
 6NxsC2I/+HPA3n249pefi/YsIpxzTaF6/mjhLI9LaZTueuMRH6fLHnpTQGDPBCd43u3UmIgZ+N+ct
 VV0wXExpF7xDtTMf+ZvqNEqE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1peCaX-004Owk-Qk
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 10:18:01 +0000
Message-ID: <9e23d3e0-2d45-8b03-1648-02ad9e3283f3@samba.org>
Date: Mon, 20 Mar 2023 10:18:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
 <7d339362-a3f5-f58c-ff74-15c6bf839a65@samba.org>
 <CAN05THQwkdBopESUZF7fq+feZxKWqrboc81syJi2EbzGB2dGWQ@mail.gmail.com>
To: samba-technical@lists.samba.org
In-Reply-To: <CAN05THQwkdBopESUZF7fq+feZxKWqrboc81syJi2EbzGB2dGWQ@mail.gmail.com>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 20/03/2023 10:09, ronnie sahlberg wrote:
> On Mon, 20 Mar 2023 at 19:31, Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
>> As for pointing the finger at red-hat, well that is easy, they are the
>> only ones that went on record and said there will never be an AD DC.
> 
> Just stop, please. There are no circumstances where this is helpful.
> Instead of causing drama, investigate what the issues are, then write
> code to address the issues or
> pay money to someone to address the issues for you.
> But this hostile red-hat hate trip does not solve any issues, does not
> make people want to volunteer work for your cause and is only causing
> friction and animosity between the few samba developers that still are
> active.
> This is very destructive to the project and team cohersion.

I am not pointing anything at anyone:

Alexander wrote this:

'Can we please stop assigning it all to 'Red Hat'?'

I just wrote a reason why people 'might' point a finger at just red-hat.

My biggest gripe is that the documentation isn't kept up to date. I do 
not write code, so I can only go off the documentation and if it isn't 
up to date ?????

Rowland


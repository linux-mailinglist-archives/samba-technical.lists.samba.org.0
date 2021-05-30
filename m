Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A13952FC
	for <lists+samba-technical@lfdr.de>; Sun, 30 May 2021 23:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OJCV3wfADMXhcDdstw9lwhOH2kFcCU8TZ8OiE0tJqUc=; b=5pT/M6OMjxUG2/VRkSAER5oRRA
	61V1YSbyeMspfm1jtkDt/sexzcLRpYNCVY+OH1eC7n0iAKDy7p4N3GZ3q48yWp1dau+tc65eUxfuv
	XS/HVN/MvR1bwZDENsNcBh3EolpgP1087KUCC48ghZgddVgStrTL47qUJnhFbviDzu8BpsCUVlMsU
	x5RiwGvXxfLJKW8alCN9gLcX/ypqbwFFa26bQMi5hWkd6goSaM4CN1rZVU8uPhKQV8CkrJunXxwte
	oaVyj5Sl0CVxazktXbSsFH16IBwhFrU0WD6I4LIJ4qZ0e35D4y53+CdDFg855ffLcAheivjYcy3NB
	4nU59jIQ==;
Received: from ip6-localhost ([::1]:42594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnSoK-0000oL-Mw; Sun, 30 May 2021 21:17:28 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:42576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnSoD-0000oC-HT
 for samba-technical@lists.samba.org; Sun, 30 May 2021 21:17:24 +0000
Received: from [IPv6:2404:130:0:1000:3237:4d61:ee17:e479] (unknown
 [IPv6:2404:130:0:1000:3237:4d61:ee17:e479])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 144BB80E5B
 for <samba-technical@lists.samba.org>; Mon, 31 May 2021 08:57:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1622408278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJCV3wfADMXhcDdstw9lwhOH2kFcCU8TZ8OiE0tJqUc=;
 b=YaKqW/DO6bV4YJ56pRxNE73/fkCovl5D73fJKn0bn4c1qtb9kDmqx1ltoo4iNFyKMMBU0V
 1r6PZyqc8wFEP1t4oF/Yz8gUajBSGwTjuhMckvGrfCpL2s1YuOPRopR59psFyEocjCsegm
 2bkj4UDB/GBUNLZD4bgYaJr35w6fQ9W1nVAqzMsw+MycyGMcWQk/lAeWGX7UKNKoGi5z0P
 WgOQfDe67IoSNIRQ6YDCwNcmPfhVFVnzvjho/uO9ISguR+qkPaLKMKg/WlENVZF2lm1DaG
 PJxUX+2+GkHVCZ9PBToYOdFrysqyleP/rSL44Bi53arvN2IiPDm0WEh2AOkD8A==
Subject: Re: JSON input / output for CLI utilities
To: samba-technical@lists.samba.org
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <cf23d39b-a13b-a9fb-64b1-e5094a4336e5@catalyst.net.nz>
Message-ID: <d358b42e-34c4-26e1-5de7-5fbe28e7e818@catalyst.net.nz>
Date: Mon, 31 May 2021 08:57:57 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cf23d39b-a13b-a9fb-64b1-e5094a4336e5@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MIME_GOOD(-0.10)[text/plain];
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
From: Gary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 28/05/21 12:03 pm, Douglas Bagnall via samba-technical wrote:
> On 28/05/21 9:42 am, Andrew Walker via samba-technical wrote:
>> I know we've added JSON output to a few of the CLI utils. Over the past
>> year or so I've added this to various utils in FreeNAS (using
>> libjansson).
>> Is there an overall strategy for this? I'd be happy to upstream what I
>> have.
> 
> Yes, please upstream.
> 
> I think the strategy is to look around and aim for consistency between
> tools, but don't let the lack of clear conventions stop you.
> 
> jansson is the right thing for C; the standard python library is right
> for python.
For C lib/audit_logging contains wrappers for the jansson functions.
It probably wants the JSON functions split out into a separate libary
> 
>> Also is there an effort to add support for JSON input to them?
> 
> No effort, but I think we would want to where it makes sense.
> 
> Douglas
> 
> 
> 

-- 
Catalyst IT - Open Source Technologists
DDI: +64 4 123 4567 | Mob: +64 21 123 4567 | Tel: +64 4 123 4567 |
www.catalyst.net.nz

CONFIDENTIALITY NOTICE: This email is intended for the named recipients
only. It may contain privileged, confidential or copyright information.
If you are not the named recipient, any use, reliance upon, disclosure
or copying of this email or its attachments is unauthorised. If you have
received this email in error, please reply via email or call +64 4 499 2267.


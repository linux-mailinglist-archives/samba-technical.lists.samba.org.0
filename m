Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9AE76DD19
	for <lists+samba-technical@lfdr.de>; Thu,  3 Aug 2023 03:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3vxlmPYbmq+dJZhK7JARUOEWz3q7dPtKQb2+CIdtEPI=; b=zA3BYM78dVo8pyQH+C89WnvYd9
	7cwSAL7e+k3m7or09fGMctL7lhlj/xw0kJ3Zjm3ltvy7UrZ//t50kypsm8O+2uyJwqbkHwh/KSacl
	M+LAS6WcbhjN1ymF/bCcB9cxJ+x8VMAjsj0xyzTPr9lftA1QozqUZFh5GTouSxy73aFFBGPyuxmVk
	bJ8ATG/+hwLEssEyi3t/NW+NOQUJqP+LraJbOjpCO5tfaMymK86A8qfGoYdGkVjb+xF+9Jo8EsKae
	QsEHT/7SJqgbMHvk4QtIzQs19J0Ik+aaibj6EaBwqs0+Sszhs2Hlb3pMjRIg75wGQzCfnUvItPUx5
	bhmpGAiQ==;
Received: from ip6-localhost ([::1]:51392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRN3x-008vXV-UY; Thu, 03 Aug 2023 01:23:38 +0000
Received: from mx.inno.tech ([185.228.49.205]:52445) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qRN3s-008vXM-8G
 for samba-technical@lists.samba.org; Thu, 03 Aug 2023 01:23:35 +0000
Received: from ksmg2.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 7EB5B4000C;
 Thu,  3 Aug 2023 04:23:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 7EB5B4000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1691025808; bh=3vxlmPYbmq+dJZhK7JARUOEWz3q7dPtKQb2+CIdtEPI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=o89Lq+xox7fKPzNbQV1mLJIMfugxobYFBdxWD74ik2Iy6+OTmrwnjccnPAg+5EVyQ
 aVbqXNbaJIcDtIdrVaFxp/jssUgFCuD1V+fg3iLEQnavdNsM2YXS1ayk61YWI3rOmD
 N5v6Sg+NYzohxUtUYohlUbkk/XAqolq8WGct58CMkJ32lXr5mQSYljXbXUBi3Ojng3
 b11oX/b79JrVkp7rJuQGuQY86KypF4nJl2he4cBo804Uy+BJ1SGKtpsWbRh7aeRxtY
 bNbuyrS8BUKpyshgi0UdDzwhbAbiFhjlSLlemyrV5DXhvGOrhGtDglzgN00T9kXYjd
 7I0QwLjpEJlSA==
Received: from SEC-DLP-QRNT.inno.local (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Thu,  3 Aug 2023 04:23:28 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230803_042328409_00000582
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.100.71] (172.28.100.71) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 04:23:26 +0300
Message-ID: <d1755029-d396-d1a9-167d-bcbe8b027021@inno.tech>
Date: Thu, 3 Aug 2023 04:23:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, <samba-technical@lists.samba.org>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
 <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
 <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
 <4503211.LvFx2qVVIh@magrathea>
In-Reply-To: <4503211.LvFx2qVVIh@magrathea>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.100.71]
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: Pavel Kalugin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Kalugin <PKalugin@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 8/2/23 10:25, Andreas Schneider wrote:
> On Friday, 28 July 2023 00:07:03 CEST Pavel Kalugin via samba-technical wrote:
> 
> In case you're looking into a first task. We need to replace lp_set_cmdline()
> with lpcfg_set_cmdline() everywhere. The reason is that lp_set_cmdline() leaks
> memory.
> 
> First start changing the client tools, which will be easy. The server side
> might be a bit trickier. However it will give you a good first entry point.
> 
> Here is an example:
> https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lpcfg

Hi Andreas!

I'll definitely take a look at it, but unfortunately not before the weekend.

Thanks.

-- 
Pavel Kalugin
inno.tech


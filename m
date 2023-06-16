Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3A733AE5
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jun 2023 22:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=999QaSvf7sCZ/X3Y7sbmRZ1NreYyzrzIcKgETwwqQ1s=; b=AThxMZyWvyqkTXB/vzer75XWRg
	JSxS+YlhLByr5+mpPdwwJNj6dtSJbDy6Hy/46ZfNvI3Y8wdo+MKuQGP6h2KPTM+YpcAVUprLXB+9Q
	B2uq7fgx567BYCq889OUiBom89hD3An0mU2D227c+8S/HkNBMuTVe//lEkP5TWps3ra7pHuUf8r47
	rUxO88seyVMzNoEtABz2wBQDG6CDe+ActA2jJ+OHwa8bHhRkrsWytc+yQOWcElT7fqAuTpiv6dGu8
	m3dd2kUO9XJTiEjE1yhVth6qQYbIrgB9kZBQhXBSzMuaHiwjrEY/depcqboMrL30MD9coL4NPMcjT
	TiN02ynA==;
Received: from ip6-localhost ([::1]:53504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qAG8L-002qd3-8U; Fri, 16 Jun 2023 20:33:25 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:51043) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qAG8F-002qct-Bi
 for samba-technical@lists.samba.org; Fri, 16 Jun 2023 20:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=999QaSvf7sCZ/X3Y7sbmRZ1NreYyzrzIcKgETwwqQ1s=; b=hpnrsVmaB+jE9EXSYJKa5I1mkL
 iyZ6TkplEVwMSYcD0XHU9cnOAh8s8Lx5fUn6N8FwghO744sBOnvRSwyGtNeX+9ilLyjmNGX2qEGZE
 UaFcVSH4qKhr3UM3xzr7EaKNIBEyenKPVXGLtzQCaGzunY+F5KsB/8GVwsYKfuyE8Euy2FiLfg+bF
 8x1wVa7iebavuoap/qOKpJDW7+H3GPAf0uJi3LxbzwLGId2OIni6/znPrj5nhgDkDp7XZ+b8IDUIm
 fV1bnFsujAzBOa2QOFmbPrBLrhgDSTVKJbD48t5Il95jMeeDfp5xxrrgAX7w5ajcYv6CFPi4RglSR
 W2xeA7ng==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=999QaSvf7sCZ/X3Y7sbmRZ1NreYyzrzIcKgETwwqQ1s=; b=lLFgM+AVv6nIGtdBcp97n4DKtT
 HLcwZgtleTjoHwpWsaG9dDQvUt8qqJ/DGVKqvAG9BoosmLtqSLzdnSww8HDQ==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1qAG8B-00EY17-P8; Fri, 16 Jun 2023 22:33:15 +0200
Received: by intern.sernet.de
 id 1qAG8A-003Zvw-9u; Fri, 16 Jun 2023 22:33:15 +0200
Message-ID: <be0e46bd-279a-dcf2-f1e7-88b24fdba9cc@sernet.de>
Date: Fri, 16 Jun 2023 22:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE, en-US
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
 <9d98b4c6-9838-9877-d657-b5cd0031fcd8@catalyst.net.nz>
Organization: SerNet GmbH
Subject: Re: New option for samba-tool dns zonecreate
In-Reply-To: <9d98b4c6-9838-9877-d657-b5cd0031fcd8@catalyst.net.nz>
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

On 6/16/23 00:06, Douglas Bagnall wrote:
>> In the code there are two flags DNS_DP_FOREST_DEFAULT and 
>> DNS_DP_DOMAIN_DEFAULT. So maybe something like 
>> --dns-direcory-partition=domain|forest?
> 
> I think that is probably OK. Another option might be 
> --dns-replication-scope, which might describe the effect more. It all 
> depends on how AD administrators think, something which I have little 
> insight into.

yes, I considered something like "replication scope", too. "how AD 
administrators think" made me to ask for this on the mailing list - so 
thank you for your answer! Next time I'll try the Samba mailing list, 
maybe I reach more admins there.
> In any case, in https://gitlab.com/samba-team/samba/-/merge_requests/3129
> you have the --help text as 'DNS Directory Partition', which does not 
> add much information to --dns-directory-partition. Whichever formulation 
> is used, the help should use other words.

I completely agree and fixed that.

Best regards,
Björn

-- 
SerNet GmbH - Bahnhofsallee 1b - 37081 Goettingen
phone: +49.551.370000.0 - web: https://sernet.com
http://www.sernet.com - mailto:contact@sernet.com
AG Goettingen HRB2816, CEO: J.Loxen, CFO: R. Jung
data privacy policy https://www.sernet.de/privacy



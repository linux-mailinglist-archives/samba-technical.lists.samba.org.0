Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE7731F58
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jun 2023 19:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=K/mMFSBnEnl84gcL+ThXKigkhx377ekIVRKwEAtzz14=; b=RNefBol2rSjnYsb5TwGpaGVOCn
	1kPlHWeSGbNXgVr9RDTdVNtTlqaUADzeOLmPKU5IKZa78Rj1x7UShpYbbvsAe9v/n2p6tJpetDWWp
	lJ62LnbtDdQnsb4RkFbpyHWd+RO2ke07LxPvxu7HX8fXzV0Mhpyx21C6UhC3yONZdUw3gZqagEvah
	C3mEnF/m216afGqT7kCgpZCMliVc/RrFbCzCP/In4hya3LjUKlmndDkZKLEr1a7Gj3zIFcPlwjniq
	zAxX5mpLQ3x/ysuULWZ06iHLQgODQi8f3a4URw7S7o38y0/L9D4NmZnPxfU+mTZO0WVv4CNnhdcPo
	C3PsYNdg==;
Received: from ip6-localhost ([::1]:26712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9quK-002cko-7K; Thu, 15 Jun 2023 17:37:16 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:47689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9quF-002ckf-1V
 for samba-technical@lists.samba.org; Thu, 15 Jun 2023 17:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=K/mMFSBnEnl84gcL+ThXKigkhx377ekIVRKwEAtzz14=; b=gfeE3zkL/+cUtniSk+oenK38SS
 T2nXOvNf9gFSl2pMPs7Ahl2p/Vw1e1ztoAdHAdihbTa6D65C6WnhMcW9iJc/nhA+0KIh1ot4tAmzB
 t0UPId8EGXYz3iygDGARlLkMC362DblDsp1Kz5oNmVbzhkA87gsk1eQsRdm1UfQjNKdAwcVQrE9JE
 tlDRRkILKsqONtGV1FyL7Rt4ZLW8tvvVPrKhf3pqc3/zmrzTzHbkgx2ceyv+k7jnROBY0H3n2nkMQ
 FO5XYZzp8pV92hStb9+TFNCX+mruXwYGMQw5zU1MP0DSpvkLTTzmRYg6tnFEeQoxHNW6Z0iZyniqX
 CDOQJnBg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/mMFSBnEnl84gcL+ThXKigkhx377ekIVRKwEAtzz14=; b=77h6dHsp7V6K5fRNTjM32F2Anu
 lo5rE52Z2DlP/B+jdxG0tU4LgfIzM+EK+feAPpcpb8VYDD7cHh1uDW8X1jBg==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 for samba-technical@lists.samba.org
 id 1q9quD-00D7TB-7N; Thu, 15 Jun 2023 19:37:09 +0200
Received: by intern.sernet.de
 id 1q9quB-002MMW-K0; Thu, 15 Jun 2023 19:37:08 +0200
Message-ID: <64f9a373-a237-8a88-0508-9a04214bf4c5@sernet.de>
Date: Thu, 15 Jun 2023 19:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
References: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
Organization: SerNet GmbH
Subject: Re: New option for samba-tool dns zonecreate
In-Reply-To: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
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

On 6/15/23 16:38, Björn Baumbach via samba-technical wrote:
> I'm planning to add an additional parameter to the samba-tool zonecreate 
> command. Currently there is no option to create new zones in the forest 
> dns directory partition via samba-tool.

I've created a merge request (marked as draft) with the 
--dns-direcory-partition=domain|forest option:
https://gitlab.com/samba-team/samba/-/merge_requests/3129

Please let me know if you have a better name for the new option.

Best regards,
Björn

-- 
SerNet GmbH - Bahnhofsallee 1b - 37081 Goettingen
phone: +49.551.370000.0 - web: https://sernet.com
http://www.sernet.com - mailto:contact@sernet.com
AG Goettingen HRB2816, CEO: J.Loxen, CFO: R. Jung
data privacy policy https://www.sernet.de/privacy



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648F7D1431
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 18:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0koXHyX6e/8zZYStGDHyqR8HUsBgDu+kDAm825ezxNc=; b=vn8tgTHj9TPplHwDxaZbdkfe8x
	UjX+HH7ug+5SRx+DAnDHzc/1w0ieTyWYfJ5IM1y1FDNqXkXRRO8YyPJ5uFjHHy8WpfGmjKCeVQRcS
	TTPPETfS0kJVYXlsqJrvI8DwpN1hoQxA/43LhYzzYxpcwIarOMIWo0fUDFOV25fv6QVeS1SW0VOXt
	4TFoAqn7p7RGuLJkM6IGsMjleMJT0fnwBJc+pxSclY8W2izPsIe+pVdaPz4Hn+gdpNm5JjVX4dDrb
	adrH8y3w4S/FOfx/p0MO8JvrSAv7ThY//kcO9tzDEK8/N3jJBn1oRP+j9Csn5khw+fSDA+PRj6q05
	Cj5K3sBA==;
Received: from ip6-localhost ([::1]:23980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtsW7-001YFa-47; Fri, 20 Oct 2023 16:38:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtsW0-001YFR-Ki
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 16:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=0koXHyX6e/8zZYStGDHyqR8HUsBgDu+kDAm825ezxNc=; b=oOVSdIGL+fBvcoC7CslSFe9Yil
 8w/GfCMJnNe8Zv6TIozBMEWE3T0kCarbnJrAWOdvz6+2pVzEbLwgiFiJowhgd/EzvBvuQUl3IvJ3y
 YYtVT2Zkmy17y6c1EWYg8cE5RURg9f2UkFOds6h94u84/1CUFBN7AseLOXXzEw5s3H94wLko0jQm9
 RYMyj4eti+sXUFCu1In7oexniasgz6raZNmaZn9yUsBA+bo4Ihz3WTS1Ks8KDgLncvZq/w5KWUI0v
 GHC2ex7teKO7HO4qCCFkFACCPSlR2FBJTuklEKcRrTNwVyOasoLro1gwMK07v1ZVAcjquerWP0nWP
 t5Th63cWB+a4OCXdAACNZTFORGLMEI25g0P43IgDgN7sKsXJSz3LI+ydYJW0dscKCx5dGIwOovXeQ
 uaeCHkO7maG/LrUCBCD6Y56LJ62+9FdrTBRWhb3m3KU07nN2HRxIkWG1recPQgb1b+5P65uTMRA4h
 ifzfo0L7SQuWjoPOZB4oYX6W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtsVz-001jo4-1U; Fri, 20 Oct 2023 16:38:23 +0000
Date: Fri, 20 Oct 2023 09:38:20 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Samba on top of cloud ?
Message-ID: <ZTKs/IlzENMoImiG@jeremy-HP-Z840-Workstation>
References: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>
 <8d3b4a9c-a821-4c86-af1b-cc8f101b218f@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8d3b4a9c-a821-4c86-af1b-cc8f101b218f@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 20, 2023 at 07:13:25AM +0200, Ralph Boehme wrote:
>On 10/20/23 02:08, Jeremy Allison wrote:
>>I saw on Hacker-news this:
>>
>>https://cuno-cunofs.readthedocs-hosted.com/en/stable/getting-started-core-concepts.html
>
>fwiw, there's also juicefs which is at least Open Core (might also be 
>fully Open Source, don't remember):
>
>https://juicefs.com/en/product/community-edition/
>https://github.com/juicedata/juicefs

Yes, this one is interesting too - though FUSE based
for pure POSIX clients though.

Wonder if we could interest them in writing a Samba
VFS object for their backend protocol ?


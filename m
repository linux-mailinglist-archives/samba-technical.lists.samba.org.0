Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A29AD75A
	for <lists+samba-technical@lfdr.de>; Thu, 24 Oct 2024 00:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o1ClCNcX56avZvofbBaOiQgU0ztSXb95WoOZm0+pxmA=; b=6DSVNxbbUojl7WCPncct7Sa249
	5MXZ6u82+dP/j/ULFheTs/Cpud6sLsmhSdI2ukz6/F7992DvEdoXcoEK1J4g0ygn3rVW2p6ILxb7Z
	joWKEe6IYmtUFsLqhvUNfDwUnCazkliz/xXkcFCU4H8VzgxmtSDiAkCi612YjY7Fq6CEFpv5Or2l+
	EuOVNgLcX7hb52os+tyi4hxMiU94ImEvFBYrHsE/L+kfzx9cSBOAoF5PxYOcNb6Z24KYPhFCfFhGS
	lWvVy/UDaXlz3fVDNcMZlQYnBaPRd4DrA1VW9W/3BjqJ2aTfU6qp5qnf2mEEP469natu7Fawa1HdE
	BsLIK9AA==;
Received: from ip6-localhost ([::1]:56322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t3jYR-004rm0-6f; Wed, 23 Oct 2024 22:10:11 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:38240) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t3jY8-004rkw-3T
 for samba-technical@lists.samba.org; Wed, 23 Oct 2024 22:09:57 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id 3E3B98A;
 Thu, 24 Oct 2024 11:09:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1729721386;
 bh=fPVmF28uyagzZ2VeRe+6Ik8w2rWRO63fh/X+wPdPN90=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HeN5vaI6FPwWyZCiiNnag9yvVD8lSvbFtLneY8w99EIH06mVY+havLy2S9vwkNuPr
 vy0Fe5lF/o8Hh3tNro+KluO+kNfoiSsDvu3X+5HVb1k33qqdcmfpnzY/xpRu4iQRzs
 WAguHOoFp/l36PiBRh5zDCfEVmjcdo22tbZ+4V+AeYjOuE1cWm15uzFVXs6qjDsm8D
 JzbWtPh3hYFLlquR8//A0Gh7XN80CkLEwh+9rEFZIVyUQy6jh0AmWT67RnKhzmBk+W
 9mZFieeJDOUPPEV/aL1uGNWC5/DOtH8qfvFwOFi41hYFVFrY6UNsK5GeccLbLGUUxu
 LgFr4YNuyux2w==
Message-ID: <60405467-4994-4a9b-8d31-136871c5b721@catalyst.net.nz>
Date: Thu, 24 Oct 2024 11:09:45 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
Content-Language: en-US
In-Reply-To: <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/10/24 06:54, Stefan Kania wrote:
> I found:
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms- 
> ada2/9f1eb215-daf1-4fe5-a31b-1bef8cc1baa4
> 
> So using msDS-AssignedAuthNPolicyBL instead of msDS-AssignedAuthNPolicy 
> should work

msDS-AssignedAuthNPolicyBL is a backlink that should be formed by adding 
msDS-AssignedAuthNPolicy elsewhere (if that doesn't happen, there is 
definitely a bug).

So on a computer, you add msDS-AssignedAuthNPolicy containing the DN of 
the policy, and the backlink will magically appear on the policy (like 
member and memberOf).

cheers,
Douglas



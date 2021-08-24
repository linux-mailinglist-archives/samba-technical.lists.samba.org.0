Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D63F5D0A
	for <lists+samba-technical@lfdr.de>; Tue, 24 Aug 2021 13:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2Z4TE3gOZVj/w9KwORy4MbPHscjXEVaM7Q1KhT++y0Y=; b=Yojs50Y+K9xAzdElQueGxlnwSX
	3tETQY/5ceUXikMapLqnmQVfbVqhY9ghBJ12UJwMHCGerGuG2rIyr2F/7+yN9Tbryn02PmP2Qjsxh
	u8DpCVIUbR7A2YkesFAvIwqh0nsV6pdwjlTDqoL15Y5nJi/AhkT3tIhjtuXmgJEA/jD8xxCUOtTBM
	B2OWSXGO66Eeb6fgSP5Pb24rqN1ZGFPhYl8elGsTLGQh39IlZkk42Ag+cBpGnWMv9RgfT7+t/2Jt7
	4Hu8c73rIjnJitjwfJ4b5zbvjBKYQhn57uKrvOwIIN+iSWahSoZVIxHp/rCkJkE0OZRqObxLM+oT3
	BQKNeqIg==;
Received: from ip6-localhost ([::1]:34508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mIUUn-008gTo-4G; Tue, 24 Aug 2021 11:21:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51840) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mIUUg-008gTf-4a
 for samba-technical@lists.samba.org; Tue, 24 Aug 2021 11:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=oVG/s5mom0j11OSGv+9YHA7DLLNYs6EFy9DCIlmltWw=; b=GMPJoR42VIi1G09QbrYotwb4Nw
 iG0ck10mm3QJS8hthw7Ub/4roHObMOd979gOK+A3o1Rl+h8EmZpsqPwXydbwLbm7+Xew5+Bym+bw/
 ZK8e6dOdmSyqfFEGhpiEw3aL7lNJKDBVzgLWSSXxL1NWechQVoCcaW3BcmMemPH2dk0Kj8lUCOGx/
 S6TsiOfKaI/Z7EX6R7i8SxsJr7mmQbmpQUe+lXCslbDamThWKLz0NvJ5NlygajFuYhZcxpjruNOdw
 O6sLxAqP6zIOg8cDhVZSnBrCH8ApivrSSu8lmJ80jYVcY3KkyTlfyKw8GGUYAiUu2nCxbd0tabSZ4
 +/y38MH72uZ5uFpIMo5W3xbNW0IFn0MPHnOyzhQIFxHZS92uOboH5YIwjmD4JkMbDcgc56cuHAkcz
 w+HZdm40KrZyBgo4I4Gx8FYvFL7zEoJ/Hyn6ns+m13k+m+cDSk2OkJsRhh65qTu6FWwFWPHCQp/b3
 IvFspD+wgAAaMUMjINqMzvk3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mIUUf-002kXK-BG
 for samba-technical@lists.samba.org; Tue, 24 Aug 2021 11:21:25 +0000
Subject: [Release Planning 4.14] Samba 4.14.8
To: samba-technical@lists.samba.org
Message-ID: <7cbc74a5-4111-d312-b7a0-c195ef91efb1@samba.org>
Date: Tue, 24 Aug 2021 13:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.14.8 is scheduled for Tuesday, October 5 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14  <https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14>
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team	https://samba.org  <https://samba.org>


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F64CCAE0
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 01:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4fa7yf74QtnrG0k+rBrYEwcxGBExc84wj4GY1+bc9+w=; b=GFHyBTRlDXwg/GErVyodHgKu4v
	VnZi+LHp5AW3DHIjdFs7egY7YyH3WymLeyKLYroLclshMz1b7j4x4YhRmDfLV1zuJYVJzrotywhWd
	ZENL+A1o/Z88Li3cq7xWyMF0ZwY+ccKK3iwclggXZ+NZ3OlmisNftmJNsiXVHe39IRqM5kff+qjtq
	YnwyOKvkbaWaHDY0wH50zRrwanC+yYUsppzcBOy63mBsS0JpHNtXN2//Sz4j9EkR4nLnz3QZCn/VT
	Sped1p3QOX89NOWZPnEYMi960CKLLKJ7mcohIWiVUyrK3D00oPoq8pg3PDHNsox9hbxfqCmi3EMBA
	fMX0rCzQ==;
Received: from ip6-localhost ([::1]:56928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nPw1P-00Fbxg-RV; Fri, 04 Mar 2022 00:42:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nPw1K-00FbxV-Pr
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 00:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4fa7yf74QtnrG0k+rBrYEwcxGBExc84wj4GY1+bc9+w=; b=caFUq/6C0ajONlIhDpkIvAgn8Z
 FsDhab8IWT7hmA1yvuLwroXTNK+Ud/BOMuaIX6IDQferObUMHRWcXqIKzoI0eUlPgUxOIn/1evTP2
 NqkNtcfPxCtu/JWiqze0YrQyTrTOYS4sOSd2wW1juMXqYHysmlRXoa0Fv9YdrU9g8aa+ou71bfq7I
 4R74xtLjDEQPhE4t/jiO8vyYR66KpY10ytdGAWrKTjzVPs+fvNIDBjMNxNyWNUU54nrDhOuhSl9j5
 DtLLJm8UZL6sB5V9AE4Oly9gjobenVHNK69kXMio5YIqw4BJBDib4UNCT/77pnIlN+YZSUsUOYS3L
 Uw1M3Sh+ugBeUhZgAxBtvqiO/493kvEH1WN7y11vyXCen/N2eC60sCtFQbbMJzE3x1Y7OsQ0UahLQ
 mCEUkDEVT94zEl5swh+v0I0j3FA6AB/uOVtjTtS9/Daif03Ta6XUxlDUYWAqwVXBzemmaJF1hKVIs
 6JxuuZSfCTB565SK4HevhKuO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nPw1J-006YT7-3O; Fri, 04 Mar 2022 00:42:09 +0000
Date: Thu, 3 Mar 2022 16:42:06 -0800
To: atheik <atteh.mailbox@gmail.com>
Subject: Re: [PATCH] cifs-utils: work around missing krb5_free_string in
 Heimdal
Message-ID: <YiFgXtz5W26CZRbm@jeremy-acer>
References: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
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

On Thu, Mar 03, 2022 at 11:09:03PM +0200, atheik via samba-technical wrote:
>The krb5_free_string function is not present in Heimdal and instead
>krb5_xfree should be used for freeing the string allocation done by
>krb5_cc_get_full_name.

Does cifs-utils have a libreplace equivalent ?

Wouldn't it be easier to test for the existence of
krb5_free_string() and write a libreplace wrapper
function so krb5_free_string() can be called from
all code without #ifdefs in the main code ?


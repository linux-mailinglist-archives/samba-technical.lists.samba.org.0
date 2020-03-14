Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C35AD185610
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 18:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Z6sNcejie6Kia6TGXMDK74ZpntgDJWhlNhTAzIBF8Sg=; b=vG6d4proffGoMdoL/eAPJYVU2R
	g2+MGrdm/zeEi1B6dBWKifU6p4xdYzQ4aB94X35qQgvSJXHBblf5Vep+sjJ6BxNi5xVv+30WM0o5W
	GABY0YCiQJnAHQNkcTeAZ1Xmnk90i5wR3JsxeSwHBqqzNNgi7Q2lujl9GwUgQc9iavzVmKh7iHyXJ
	umWPxyON0izm5MN72JOgbGGWZt43+CLVJjM+f443OPAjoDJyOdPYlKbKd8vuWKHnnthsinWtuLap2
	ZXmHQt2bW/EVU/Uyd9l6BlAIiTQSWvuoLkWAfDo+uhdbM6cyPPjocfDmmuNkgakGuRzfDsPnVhuB0
	zXUMGT2w==;
Received: from ip6-localhost ([::1]:55770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDAF8-00G6YU-0X; Sat, 14 Mar 2020 17:06:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10290) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAF2-00G6YJ-JZ
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 17:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Z6sNcejie6Kia6TGXMDK74ZpntgDJWhlNhTAzIBF8Sg=; b=iki180HATzZDilu8Tmg3R/0MAU
 u0h2h5k0t6vgtj4d3Dn9D8RpVCu6F+I3PRUtJ7BdiTtFF+Kolv+8Nj9pTIyZry2LxkKvVTIVNhJHH
 M4mt8Wuk3T5NlydvV2yVXpUKxaigbRuqWf8+jwvBhr1rXqRB4laa/P7LYSXRNwU2TBV2cWd+9hjZq
 By1a7Zv5vdkAk6tmNOH5XU8U+3zp/B6JOIgbT47DYBIN4yxBBM63VmZBEPAQPDvO8c2oLcgF8JCWa
 dW8ZDbd7BrkgBsiPx1rzUKMA+0CBgd6oB34CFDBBdX8VgeQa+n8Bscc5DsA4C/ZTRkmYSdCI8zyJl
 SgIv3hvT2gv77vTRCNyFwWlGZqv1DTV1pZNEM+xXGUKrXTVcUn7mqGVb2gjpXW5GVW28dQ68UpGar
 8wRYtIQaftMgLFC3xWMZ3xVZyomvZ6OVqheyUlL3Sl1wygy5+ZJCDlAQasDB+o4GUnglKyTjcHuJx
 ygtL7gBRnkMh/A3O5VAFzElf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAF1-0001IV-2W; Sat, 14 Mar 2020 17:06:27 +0000
Date: Sat, 14 Mar 2020 10:06:24 -0700
To: Thomas Nagy <tnagy@waf.io>
Subject: Re: Fighting waf for C preprocessor output.
Message-ID: <20200314170624.GB796@jeremy-acer>
References: <20200314031555.GA16932@jeremy-acer>
 <E1jD20v-0001Go-QB@rmmprod06.runbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jD20v-0001Go-QB@rmmprod06.runbox>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Mar 14, 2020 at 09:19:21AM +0100, Thomas Nagy wrote:
> On Fri, 13 Mar 2020 20:15:55 -0700, Jeremy Allison via samba-technical <samba-technical@lists.samba.org> wrote:
> 
> > Does anyone know how to make waf generate
> > the actual gcc command line it uses to
> > compile .c -> .o ?
> > 
> > Doing:
> > 
> > PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build
> > 
> > causes it to dump out a python array, bracketed
> > by [] characters, but I was hoping not to have
> > to fight it any more :-).
> 
> Try this instead:
> WAF_CMD_FORMAT=string PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build

Thanks Thomas, the help is much appreciated !


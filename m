Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3528F9FE
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 22:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6HuAJySbrmu2gB+BXVqCOmz1Ui+SSFbKVdVj20gxFAA=; b=kY3plPbDvrkYtGv4ryua9sggcu
	rkUANJ3ZN0q7NdaCOWLYsaZCUv90ROfuEfq/eOz0lPc9s2iFPfrqiHBUtYENV0j3lmuFamkTmXJv3
	JySUNs5b6aR7Jd6LlVzrSn/PwGqiErym/wW9QPaJ8yjprlLqc9cAGvBiyCyyyzRVr5DtVIpdvuIVB
	KBG8jRgJyK38sviKLlW5AxpV2XQ4OpHGBNj8JtdCJmF/9ULDSY4uzR2i7tLF8pA5GbOadtnMrzt0U
	7leRjfZ5Cbm8vkauXEKVgoBYk08qGkpWdwvwJbkfHCDF12aW4yYxJGbvx/+8HiHre/2mf/LgNruYb
	Nec6NrrQ==;
Received: from ip6-localhost ([::1]:19910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT9cd-00CKLA-TT; Thu, 15 Oct 2020 20:13:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65366) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9cZ-00CKL3-JK
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 20:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=6HuAJySbrmu2gB+BXVqCOmz1Ui+SSFbKVdVj20gxFAA=; b=tk4M6Q0o++rhMlqNXc6L3XDL19
 3LSngrK3SgG9d1EuDhTrBOuSsbYxrFSEo9EoIYNVJZm2bKuiR47xPmndUEPic1mXMbAUe+jq4wnGU
 KnjmQhsvn+cLhgL9W2SDJ8qPYTd3D3f6jLkh8QDS/wkYbQ6U2uUwd8Gy8uuCYepuFByPe1r0forrG
 s+rs8Yow+gzJOKUzWTyZw40WU+ZBkLhaDHMWU4UFWsBGo8MjsAo0myIe9EmSoaxq4O2nPkluV42aE
 H0rtFoEOCY3nShQWIEKGlN3omT2h80j5qTT8FSrrLna2lyHczPGv7WsPdxQbCHaJNf9uHMDGJn6UM
 +6zm+ZmGVQwV1piNhk4SVW4jQi9cMuXXz8ISkXUid9OIESpncxp1ut6EXQLEP0nZwq0EniuvqNHsd
 hYG2DUsf+UjcwNXurrDh2gK50UOJkBVfd8p6fyY0u0qHOJWPHFVUBYbnAdgnYs2H+dgdbpoeWHQ9j
 LH51iAD5SVMSRFkYTrmcsJL+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9cY-00046m-Oi
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 20:13:07 +0000
Message-ID: <a239f7d8a05c3a0c3b50f5bb312bc0d03b2f290d.camel@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: samba-technical@lists.samba.org
Date: Thu, 15 Oct 2020 16:13:05 -0400
In-Reply-To: <20201015195534.GM3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
 <20201015193751.GJ3840862@jeremy-acer>
 <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
 <20201015195534.GM3840862@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-10-15 at 12:55 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, Oct 15, 2020 at 03:45:22PM -0400, Simo Sorce via samba-
> technical wrote:
> > > Personally I think we should just add the CC-By-SA
> > > attribution and be done with it.
> > 
> > I'll let you argue with our counsel on that :-)
> 
> Fair enough - we should always do "What The Lawyers Say" (tm) :-).
> 
> I don't want to change the text though, just the name
> if we have to.
> 
> How about:
> 
> Samba Developer's Declaration of Origin
> 
> "Declaration of Origin" is IMHO more descriptive
> of what the person is doing, as they're just
> providing a declaration here.
> 
> Thoughts ?

I'm going to take some time to think about all this, so I won't answer
immediately.



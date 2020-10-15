Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2828F833
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kVhRrAo2w0AUK/E9hMisgXJK55Uw7Rle/Wq5ncZAbM8=; b=AEGi9YJCGORENIZTJx4N1ToBjv
	MsWbyGnkprn2C7TjhfxXCAijvGCvcMFib5NgQDBdChO2TYZ3ZtvWTytJr+cpbS1aczTRDVB0Dikss
	YA60wYU06luUVabkJYbt+AxN+qKFbeb5KX3eDHOfBpk5xvqJtkeheakUvP04yXOi2ZRNP9XYF5pSW
	njvA/GjvDmmXO7XuL5VcB8o8dZM89Jd0rwAyl8kpoR+G/Byr6SiYW/wp06pp4jvMDG9qg6T/q7iFv
	s2l6Y2Oj/VW/XlX543S3GeFqsqViACxHVxZFv/KEcwZMzXH1biHVJl5+pv77XGUyqaaGaG99ots5q
	ulsDs6CQ==;
Received: from ip6-localhost ([::1]:54384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT7iR-00CINf-Rx; Thu, 15 Oct 2020 18:11:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7iM-00CINY-Gw
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=kVhRrAo2w0AUK/E9hMisgXJK55Uw7Rle/Wq5ncZAbM8=; b=Dpk0ZV1KzNcx6QuB+J0v8BByu3
 YSWaYpOVadOdQsJpL6KZqugtCbi080762zfQBOPb2YERgvYOxeXYAT5AIJeFEAIxQNABG1QAhgxYH
 mTlldlkXkvcmwtBcvjR14Ayk/60FG6sh3/HxposSwV/okSL+BELN9o9Vv4ZGWOtFdCII1JRrQCrxG
 OdT2xy6MJWevo2j6SdI0QpFQZlZEe9zfa/KDlj4S1H99nVD9kZvSASyoT5HDvb7gScLO4ix1izuCs
 1zGdW4+fpFiNoGZ5aTpWWzDM/7bNChvp8yDGGerimYcUbk02rBWx9Iqaf0YbCx3Oz8fJZyogTykqY
 ybEyUzu3OG8P/rt8yX2SIerFVcr5HHEouHSy+7KDkaJMAWh8/V4UW21qtXBY/R2BkZJTJ/+TENP3E
 3ts4n/4Ybh5Atf+7fbkWrW+aC1p9wEWJ1dszliTo7rcPujRiwAW932tMoPI3ZOscBlHO6fQNbTOc8
 vgDhnPpygYccu9w1HEva9K3t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7iI-0002R6-I2; Thu, 15 Oct 2020 18:10:54 +0000
Date: Thu, 15 Oct 2020 11:10:51 -0700
To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>,
 samba-technical@lists.samba.org
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015181051.GA3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org>
 <20201015180510.GE3769001@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015180510.GE3769001@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 11:05:10AM -0700, Jeremy Allison via samba-technical wrote:
> On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via samba-technical wrote:
> > Samba Developers,
> > 
> > As you know, it's rare that Conservancy offers specific patches upstream to
> > our projects, but I've submitted a merge request here:
> >         https://gitlab.com/samba-team/samba/-/merge_requests/1609
> > and I've also attached the patch here.
> > 
> > As many of you may know, Jeremy Allison originally requested that the
> > Samba's Contributor Representation be named DCO as a tribute to Linux and
> > its DCO.
> > 
> > But, for a variety of reasons, I (with this patch) recommend to change the
> > name.  Also included is some cleanup work regarding the copyright and
> > license on the DCO text itself.
> 
> Sorry Bradley,
> 
> I guess I screwed up in calling our Samba contributor
> agreement a "DCO" as that's what Linux uses, but ours
> is different from theirs.
> 
> In my defense I just thought that's what such things
> were supposed to be called.
> 
> Plus I didn't notice the original text was copyrighted
> and under a CC-By-SA license, so we should certainly
> fix that.
> 
> Sorry :-(.
> 
> RB+ from me.

Bradley,

Should we also change the text here:

https://www.samba.org/samba/devel/copyright-policy.html

for consistency reasons ?

Jeremy.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF411854FE
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 07:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G4EmhEt6205UwcEkT/bDDHwFUXcZ+P2IkdT3aZrJlWU=; b=BlG7Um+yjwXGplQn0WfYzSc9NV
	mcwF9zJYbj+1qtSZz5S42KmauJEeG8crukCeIBFyOXRqhsvAyMWI59tsmgI6+zgsCfGK36+4XAPf8
	9EOfN8rQrzvmQkkUBzqq51OfwpXeOOT+l7q1BVCntSlU/86wSdkCvDKgG7vZDMdTWFIr8l3Ubkr2T
	rlKG4suILyHjyfPXzRpKFwZSg7LpHKDyiIYGhQRWQ6FPeZe+YXo6pWkXFJUPB7ce0mCheINTggAiO
	wP4TyCBxRo6n5ApAKOiNDBmLSBLQP5M2HakoLxRC7kCA8Ck2C55qWGBHV+1191/3ZADj1MPr0vvqb
	i+Qk8bnQ==;
Received: from ip6-localhost ([::1]:35860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD0bn-00G36F-0Y; Sat, 14 Mar 2020 06:49:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40590) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD0bT-00G368-Lb
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 06:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=G4EmhEt6205UwcEkT/bDDHwFUXcZ+P2IkdT3aZrJlWU=; b=S7a79VD+vfu3TxMZ7xiiFqmzt3
 hcvpKWlzqFeeJkyaxwRbHmB33fFQxwBQ1VUvQYGMw3o0VV+alWY9omxjcCVS4hCVAlgB/EKchmdHA
 /TxMk7iO1XO5U2XbYPPQDcxEj3YVRJ3famaLT0mKr3eQEleDo5LJnC+wtWgxiCcEU9PMUNZQDw/3w
 Gz3l8jZCvdx+DwH4p8ofwxwfQbBlWjgi8S043gYBOjypCHtM/GHQrfjqCoRFln+HdRn8MZ9hJwQ6r
 tFRHa10cSm5zIDZ/r+EpBH3pWawruHVFkgnEJ1xqlEp9hXgA0q1yUFoJUQaJqZT9XktP8h2QCM3pg
 Yjaj1kQ1pB6YNXIGV+ScpudUIh8J5xhC5Fchiolb8uemrL5lfgvZa/X+Cxbmwylj/Mx8jXauzOB/5
 wcRS4VmlwZmBmDakuptWh4wmb6FiNDZWI1Hksr3xwwJLQlX3TYxKklLsuAuMDfOXNV8wQ4v5Suaz8
 awJdaQDdkBxpIjwyhhj1aeAR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD0bQ-0006ly-5p; Sat, 14 Mar 2020 06:48:56 +0000
Message-ID: <91c865a391d97aacc0fcc50c50a699a8c7f7d800.camel@samba.org>
Subject: Re: Fighting waf for C preprocessor output.
To: Jeremy Allison <jra@samba.org>, metze@samba.org, 
 samba-technical@lists.samba.org
Date: Sat, 14 Mar 2020 19:48:47 +1300
In-Reply-To: <20200314045835.GA22912@jeremy-acer>
References: <20200314031555.GA16932@jeremy-acer>
 <20200314045835.GA22912@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-03-13 at 21:58 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, Mar 13, 2020 at 08:15:55PM -0700, Jeremy Allison via samba-technical wrote:
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
> Never mind, I turned it into a command line using
> the magic of Emacs macros :-).

I wrote this script to help a while ago:
https://wiki.samba.org/index.php/Testing_removal_of_ifdef_or_configure_checks#A_script_to_help

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




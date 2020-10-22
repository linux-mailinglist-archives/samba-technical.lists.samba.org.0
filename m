Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915629566C
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 04:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Zh9Wud5DpbQvnsSSV/tI/bvdge3VQ5mwn/lxlO7tHB4=; b=mLRrg3MPApKeo/4F+XIIOtRqHJ
	5It4ZWOgChbLClcg9RO9HzOtZsHTU3nttaTozqpwAY0tfvTneYiW92sZ9/zSAcVtpArYbTYmwmao/
	Ge1Xa0JRybggcqUp/1Co+Aiv34FuV982FZonhR4DBHI+nRubqIygzCPie8RaUPUReIS9GXYVjdYoF
	NISofrbYGHQJKQJdg6p3iro5dmzGpF0t1+02uJvxMwXUlqHOv5sJMZP6GhVQIGKJbDR2w0cpISWZk
	1GMbIabcFhKX9bPX9g0RYPNSlb89hDLYtg6wmOrxTOcUhVxJGEYJFKcYg7KSZswtS/lHSW+0W+bY3
	A4iXuXAQ==;
Received: from ip6-localhost ([::1]:33290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVQOx-00DDkS-DO; Thu, 22 Oct 2020 02:32:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVQOr-00DDkL-8R
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 02:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Zh9Wud5DpbQvnsSSV/tI/bvdge3VQ5mwn/lxlO7tHB4=; b=0Eh84X1xlktChI6Ge5+H1THGNv
 f+5zeAnkzfkWRO5YAK4SJC0w6swYfZGG1OjXsd+ISg6FAasF0/hqkvpg5UuRgrXcBk79kbGSuvCYM
 I0Xif2uSSSzXgln+9NlMFAXLt5/k+7FfpYyFK4t9ionaMBCAWn83MbcrCWm4cywwD2WnhKAPRqSng
 eTE2rUNuADN6z1O/NmrVIJ/x5g2nBexD5Rq3kfCLQWC3TofeI1Vs3FUX034K4cFRqE9Jy6NHRs5Ib
 gmIszDq3+VHOcnwk0RwtNjPhcIYSAnrc3x4OaNqhd+FhfHJzM1fjMLwAib3kAI69ozcsCFJs3KePT
 0s9KQbE06mvglONWD4jFGQKVvWXodECZ9QlBEuyGsn9jaCdrhlZj+5x2RNSrXdvrkAeGiIUCiPKml
 BoTFnN6JmSCgDInoT0J6art5m68BugSUSkquRqdeI8I3kAeBFbzt146CoP1KqEoJa10DQJm5Bqvkw
 SwbObgtHPHGj3+F0xF/CD7ZJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVQOn-0003NL-FJ; Thu, 22 Oct 2020 02:32:18 +0000
Message-ID: <b17eee9eaad9deabdb038a1d0c9b47dada2e85e5.camel@samba.org>
Subject: Re: issues with oss-fuzz and missing libraries (avahi-common)
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Upstream Samba
 Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 22 Oct 2020 15:32:13 +1300
In-Reply-To: <0c27772a-fbb5-246f-a282-c22a92660482@catalyst.net.nz>
References: <6e676db2323a9f96443ab3cfc65a586413bc37ea.camel@samba.org>
 <0c27772a-fbb5-246f-a282-c22a92660482@catalyst.net.nz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Thu, 2020-10-22 at 14:24 +1300, Douglas Bagnall wrote:
> On 22/10/20 1:41 pm, Andrew Bartlett via samba-technical wrote:
> 
> > This isn't just for the coverage stuff - I've checked, and the
> > impacted fuzzers just never successfully run, which is a big
> > problem.
> 
> It seems they ran until 8 September, and haven't since 14 September.
> These are the respective coverage logs:
> 
> https://oss-fuzz-build-logs.storage.googleapis.com/log-81c8b380-1ef8-427c-bcf7-7b4174f6e1b9.txt
> https://oss-fuzz-build-logs.storage.googleapis.com/log-e44362c2-f168-4b6f-88ce-433b7f040937.txt
> 
> Douglas

Bother:

commit e60df214998afc145ca482cab184691b3ddc3bb2
Author:     Andrew Bartlett <abartlet@samba.org>
AuthorDate: Wed Aug 26 15:37:57 2020 +1200
Commit:     Andrew Bartlett <abartlet@samba.org>
CommitDate: Fri Sep 11 03:43:40 2020 +0000

    oss-fuzz: standardise on RUNPATH for the static-ish binaries
    
I'll revert that and see if that helps.

Thanks for doing the bisection!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





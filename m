Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E44426F3
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 15:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=EnV+wH34K1N/uk3ytulrcoqUtPZRlGQy+dfgQjJMrbQ=; b=fotZfQLsQtPVqzn79o+zuhOJK0
	W4vGl5F/hok4/vrz7ckrcZhRq8OVJ6M3qupv9IIlNqcckbLgjkq/RroI2bOOcwqxIKNTzcTNxW3x3
	oRZ6EIN9fHp2SeWarYY6g+NsT+xW+ZqpU3GhVYomfcT3SZ47Or5KAJlTqNb96BhyL0SIO/s+GR5SC
	qn969WFA2CFpVUPA8am1VSu2SUOSRudqLDXCltZLyCnmd0Ktt8m09vaMXdDPOobc3JTRYkdp7CphI
	R/QNQaHp/Sr2Q4h6BnIdu+Q4to53LhwnJIiHYk3GxmwOUAlo59f+ZB77lqJM6RpauzTPf9T8sowi5
	RyDcv73Q==;
Received: from localhost ([::1]:59792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb2wK-0019aB-2d; Wed, 12 Jun 2019 13:05:20 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174]:36645) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hb2wC-0019a4-NH
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 13:05:16 +0000
Received: by mail-pf1-f174.google.com with SMTP id r7so3753446pfl.3
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 06:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EnV+wH34K1N/uk3ytulrcoqUtPZRlGQy+dfgQjJMrbQ=;
 b=AkVEoHu1KxqpV6UGwlS6FsVYZscoMiRR/oeTULvndR4uJo8jcPEoo2R8PKR1LiCYCO
 pYfPd1//EBTv8ydW150Zj+BhMlvv5i76DoBmjZwRT7CgU92Tmv6d0PHvvsCvoN4SEa84
 8Uz5D7dR3I3fuKWMtFbtoqMfKJjo0DFgaFTnbXu0Ts91WsmCKDmZfrZG/XyuGoNtCbO/
 1EmrfjribAZjUeDojaNLeX2PigVAasvL8sGRHS/XBPiXQAXTm9twAvgYyolz/dCFHRZI
 po/pYgeKC6qDxLUUQT4MD/aQVdktZrVqweHn/Rkho01QKAFCTzJWrsJolxx8AiM0UowA
 9UnQ==
X-Gm-Message-State: APjAAAWRwwj8s6fjaeeYLDfUJHsavkV7Ft+koZPdqZQ/RUwo3z7+WWhB
 bdkvSH1Avo8NICoGLPvy7zbB7Fh4+HM=
X-Google-Smtp-Source: APXvYqzjeK3Wu7P6ogDiE7rorduI5kJ2nz1NgbjXmNIzv/9XGYb+kAvhVQF1cXbuFFEwLM90h7iM9Q==
X-Received: by 2002:a62:386:: with SMTP id 128mr88608577pfd.10.1560344710267; 
 Wed, 12 Jun 2019 06:05:10 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id p43sm11577641pjp.4.2019.06.12.06.05.08
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 06:05:09 -0700 (PDT)
Subject: Re: Some bugzilla work and thoughts
To: samba-technical@lists.samba.org
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
Message-ID: <b37e1c69-bb71-68a0-24e7-555d09cd6659@redhat.com>
Date: Wed, 12 Jun 2019 18:35:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Andrew,

So do you have plan to reduce/work/close(RFE maybe Not even in pipeline)
on bugzillas to lower their numbers.
What i find is It's even tough to search and start working, Since quite
are in NEW state while patches are attached to them!!

Thanks
Amit

On 06/12/2019 03:35 AM, Andrew Bartlett via samba-technical wrote:
> G'Day,
>
> So some of you may have noticed I did a bugzilla spree today.
>
> We have a problem.  There are 2400 or so open bugs across the Samba
> products, and I managed to touch about 64 of them today in a meaningful
> way, not just automated closing. 
>
> The challenge is that while there are so many open bugs it is hard to
> find where to start or feel like one in making progress, a bit like the
> multiple pages of GitHub merge requests that built up before we
> migrated away.
>
> On an interesting note, while closing out up to 10 year old bugs may
> seem pointless, I've found about 1/3 were still relevant in some way!
>
> Dealing with just 2.5% of the bugs probably not the best way to spend
> almost an entire day, but I was inspired because I got some honest
> feedback recently that the sheer backlog discouraged the filing of new
> bugs, because any new bug would just be a drop in the bucket. 
>
> Of course I emphasised that we deal with new bugs with much more focus
> than the backlog, but the point still stung a little. 
>
> Many of our bugs are there because it is practice to file one 'in case
> a backport is wanted' that never comes.  Because we have no link
> between git, gitlab and bugzilla many never get even a tag as being
> merged into master, except by manual intervention. 
>
> Coupled with the fact that the patches themselves need to got to GitLab
> (or in the past the mailing list) for merging is also a challenge, as
> patch development doesn't happen here either. 
>
> I offer no solutions, not even my normal engineering ones, just my
> observations. 
>
> Andrew Bartlett



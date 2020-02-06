Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC2154EF7
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2020 23:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SGfUjFStZZp3BJ5C/i8fQBDIZ7r3Ghb9LxfX3m2XQ0s=; b=0kmLdTe/Qz94UkECfojZRwb9Go
	ZY7wg8tBxgaE5vqHDpJk/SnWM/wkqD8knr/En4kFt4m+g+ePZCeqiLz6/n6wnudCwmSShkXunKpHu
	zP7WjbtHjP/RLX0Sykr+mZGSzwCAJ9qytNES5gO6RVd6x1MXe5Gfe+1vgX+8F+1vAhwXNupRHW+bx
	l9l0QOdH+MUkYvEBpNQt15/PDEKVX8gur2Y4aUy42vyRqqrRecf6Sl+NHm7FiqZlhl+KdZKSVAiMt
	u/kqGmUdHPrhXVII/HQC+VhtbYP0wt7dhjNV0XYqojFM3eNBmqk3ph9pUWwGYgOQI/K88o+pkw2Ok
	vciRErkg==;
Received: from localhost ([::1]:48116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izpk8-008XEm-FY; Thu, 06 Feb 2020 22:35:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izpk3-008XEf-LL
 for samba-technical@lists.samba.org; Thu, 06 Feb 2020 22:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=SGfUjFStZZp3BJ5C/i8fQBDIZ7r3Ghb9LxfX3m2XQ0s=; b=03tmDnPp9dx9/nMQpONEJJese3
 BVX1ISelqpmIZoGBnnx6NriFPeEq/ikGLR/9Xvv5Cbgg47w/ZDOfGCI9gDoT4Ost+9MoVC1je8B40
 WCqSl5+gkuAnrajhV9S4GjlVG5HYGqCOgmx1+S8W1P70XIqXuKFVNYHm2FzcCCY/0ywIWcSecrTxz
 MJYqXQ8af7xpVX2mtTPebpvDxZw7jK1Z7VDg34jFL7p3opwjViAVH6QfsSbAKOACSUUHFqx+h1N04
 l8OvZ4qRJlFmjb5uPj0wnbtECiwtEqg/k4w9HcjE9aXCZxkoDiiM/QW2yFZ3uf+oe5h88xQDh5t01
 PO9b/mbpOlD7oAmyASdCliVqA0a1pJn8sZSrm0aqRvubMH2OV7snBS+lUpsv4Z7zmRIbYxtNwShq0
 pmT4Mj5csVNy/rvVINnI+h8jP+fhdF39m0E0/aUqxUHP4ZhiXTL9CZxj5Fri87IJC1/I+41PDFrUO
 3oybBV+f14rFs7EHDXQu6mND;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1izpjz-0001YU-Ur; Thu, 06 Feb 2020 22:35:20 +0000
Message-ID: <84c81689a51aee7beefdb415393b55627f3c8d21.camel@samba.org>
Subject: Samba coverage on oss-fuzz (was: Re: fuzzers)
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 07 Feb 2020 11:35:16 +1300
In-Reply-To: <4725118760e5c24f70cf6d9c4751ad565a398792.camel@samba.org>
References: <2546695.cijFyKqbAK@magrathea> <2725858.Fi8pKjZunP@magrathea>
 <4725118760e5c24f70cf6d9c4751ad565a398792.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Fri, 2020-01-17 at 07:58 +1000, Andrew Bartlett via samba-technical
wrote:
> On Thu, 2020-01-16 at 11:08 +0100, Andreas Schneider via samba-
> technical wrote:
> > On Thursday, 16 January 2020 10:58:24 CET Andreas Schneider via
> > samba-
> > technical wrote:
> > > Hello,
> > > 
> > > thanks to all people who worked on fuzzing Samba. This is a great
> > > addition.
> > > 
> > > However before we add *more* fuzzers, it might be a good idea to
> > > first fix
> > > the bugs found by the fuzzers ;-)
> > 
> > Also the build is failing since weeks:
> > 
> > Step #3: /src/samba/lib/fuzzing/oss-fuzz/build_samba.sh: 42:
> > /src/samba/lib/
> > fuzzing/oss-fuzz/build_samba.sh: SANITIZER_ARG: parameter not set
> > 
> > 
> > The attached patch should fix it.
> 
> Thanks, I seem to have misunderstood how the coverage build works.  
> 
> What is SANITIZER set to in this case?
> 
> Does this pass the coverage test in the oss-fuzz repo?
> 
> https://google.github.io/oss-fuzz/advanced-topics/code-coverage/
> 
> To test, change the projects/samba/Dockerfile to point at your branch
> to test:
> 
> 
https://github.com/google/oss-fuzz/blob/master/projects/samba/Dockerfile#L19
> 
> The 'infra/helper.py shell' command can be quite helpful debugging
> this
> stuff.

I looked into this some more, and the build seems to be working on the
Samba side, but the issue is that because we supply no fuzz seeds at
all, we fail the test because they don't get run.

Once we add some seeds things should get better.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








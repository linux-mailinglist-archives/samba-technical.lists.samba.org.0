Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E746D4C820
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 09:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NKgqKYblUmTDvQXexjnfxQCH0nLkovT/+6IvmqZM2UA=; b=KJvKxSu67BBAfX5Qa2xC6KDhWw
	+u2wUhLvQIqWTvd0BicIKPC+h/NGWmzc/4aZN5Eo6UJ3xlE1bqkySkQ+9wJrNT9dG+SlYFtyvKYUf
	4FaUoGeUwUgx3oZ3hxOzDL1QkpssMjyBnpizIQo2KSRO7iqqtAIhEjmsp9dhVdskhlevC9V4Hi+W0
	vgtatxy1u1+NxpTc7LfwKsX6Hy61Vq7vflYJjjA+zykjYEWKQusqSNfUTrSEIObbuG9MdP61OHE80
	MXLLPlUL/Sjvnfqu3NIDG2eq0/eWl+K1On7F+nRHF8gOOaOw3UO58XlIutkpOvgjCFXbq8ud7ng2w
	H4rR9SUA==;
Received: from localhost ([::1]:61328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdrJW-000ciL-55; Thu, 20 Jun 2019 07:16:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdrJP-000ciE-Ak
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 07:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=NKgqKYblUmTDvQXexjnfxQCH0nLkovT/+6IvmqZM2UA=; b=iJRBFPZWTSTNejt8DZIkATpIqE
 2lds/a8YyyW1iNdFRJoxBRNmJrM1avrxr6+PACltaFnpX0FhtlDT/y7XpFfvQAsmFPJKJPVxAWMeP
 o62JDevjdvtk/q/YWdPdaaBAu0qAoySMqRLlfjr5nnUxvj0NF5TywsmCp+Ho3dF35TWc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdrJO-0007JZ-3i; Thu, 20 Jun 2019 07:16:46 +0000
Message-ID: <046412e248fe9e2ed537e0b92b56e202364a97e1.camel@samba.org>
Subject: Re: Every-time Pipeline failing [Pulling docker image
 gitlab/gitlab-runner-helper:x86_64-58d8360f .. ERROR: Job failed: execution
 took longer than 1h0m0s seconds]
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
Date: Thu, 20 Jun 2019 19:16:42 +1200
In-Reply-To: <5d99326e-ebee-ae3d-a882-b1ae68fb1b8e@redhat.com>
References: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
 <5d99326e-ebee-ae3d-a882-b1ae68fb1b8e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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

On Thu, 2019-06-20 at 12:38 +0530, Amit Kumar via samba-technical
wrote:
> Dear Devels,
> 
> My pipeline(https://gitlab.com/amitkuma/samba/-/jobs/235933064) keeps on
> failing on "samba-ad-dc-2" test case.
> 
> Pulling docker image gitlab/gitlab-runner-helper:x86_64-58d8360f ...
> ERROR: Job failed: execution took longer than 1h0m0s seconds

In your project settings, set the maximum pipeline time to 6 hours. 

Or join the shared development repo which will run the full testsuite
(overkill for docs, but good for next time). 

https://wiki.samba.org/index.php/Samba_CI_on_gitlab#1_hour_Timeout

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




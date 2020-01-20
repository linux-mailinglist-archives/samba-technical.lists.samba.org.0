Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F257B143430
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 23:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=riUX+qBSIJucFA9vWOKk6TOG2umzy3HELx5XdK8M54U=; b=0pW/ZjCn43qOxBoBgxPdpijkR3
	moNbXXcoZVyTl7Q//HrUyZKUh5YRtXLKYAEsV6us0ceQVVqgR4RBQV5e58SE2mBCoKfJ/8b7Fe7+y
	yaLqKwATbJi/wywOu+demDgSFwfliVF0ugxgE/TI1F4+t0HburPQvTtcl76e4E6qY8XmuLP2+chcE
	ZEeZrEaswITuC8DIFl5DvDzh1yt1tRkLaDExBa9DY73eN/Zn50YeOv2yYVPuLPnH01CWid5s+QULK
	Yu9It+uXrKSNvixZ56g0SrdcyXf2e7K6eAxBADGewYU+p8vw7q3eSPNmhCIfkFMN6zLkf2zlByno0
	hz8G5D+w==;
Received: from localhost ([::1]:36336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itfmx-003x9f-2d; Mon, 20 Jan 2020 22:44:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfmt-003x9Y-59
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 22:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=riUX+qBSIJucFA9vWOKk6TOG2umzy3HELx5XdK8M54U=; b=GzpvHqVupRvnVdcPq/OWo1TCoR
 2QasRHBQWEqirwVUAkEvP3pGkqS4yANThDoU6fVOzuarpfgJb8H0nJqHQFGij7kLFSLUxsn2aeKdu
 GQistRPgA+HTu8RafKTB8XP2LhhUlSYEhh8nY2OiBDaTJSRG8i0OJqGAkGOF5yiq7Chiv8x/klN16
 a39IfHZ+7BDrWvO4fcqwvPOg15GRXdj6cyTme4/mxR75dAlQVCnkqcb78O4bi+dW4cphW8f4SlM6t
 kFfsWRk9H6tXEakkKKgrz8T4ehL1zUiZCSFr4TpvgjE9uURNg5BVWKlI/FFdVncUAiAE2Kuztur5K
 OZUpXDp3yQvrBrmjM1pVdYU2QJh33BaLt+e8qQtcns0bnEvodhdO5EKzvvZpjVAgeEP26i4pRz47r
 6dEqdSLQ9VVzYKFSAsW6oMRRkFO5QTjj5oNxXsarPVFfNWjh54Ngla6rwJtX6zia9LscCB6Z093XM
 J4zf8EQT3HNMI4fpyozFRFEi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfms-0003Pg-1x; Mon, 20 Jan 2020 22:44:50 +0000
Message-ID: <b30ae1699085cf947107a8263bd8f0c19f7333dd.camel@samba.org>
Subject: Re: fuzzers
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Tue, 21 Jan 2020 11:44:47 +1300
In-Reply-To: <5e52f989-7ea2-cd91-d09a-fdd239cce576@samba.org>
References: <2546695.cijFyKqbAK@magrathea>
 <b653187d77d8af54e240a006fd8467c8400a10de.camel@samba.org>
 <5e52f989-7ea2-cd91-d09a-fdd239cce576@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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

On Mon, 2020-01-20 at 22:23 +0000, Rowland penny via samba-technical
wrote:
> 
> I know that I wont be using this, but why are we back on github again ???

Rowland,

We are not on GitHub, Google's oss-fuzz is maintained on GitHub, so
that is where we need to maintain the list of authorized contacts.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2CD29E6A
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 20:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WrUUWSbgwSk9L1LG4NvPLxlPuE0dgu9LqZKf9+J+9yI=; b=1xVXGUkPfWFchXlIX7a1E/ve2B
	T0jf/ZoyrYPtq+RTJOK3o3/hTE29WSDslJuhi24rD4umSJh62CybIlZPekEQdhbijrTX2ItukvfSE
	nz3CY5tgI0qgMRGR0nZdz0E5QoxSfXPL8v7F83JemvTWn0K2HQCw9Tt1p23E08N1s19bq7eRvGqvM
	EmRwsFkMDoiLvBA+NM9F4hGCGTvfz98UM1ZJeqM72MNh+eXromCYxcm27fHiHKd4/Ms59L9mLv6uf
	btrI7n+j0GV9Y+LThFioB9LSoIch1F6AhbxHqrabWmf0ML/x/5ihDIuI8TGxM7eKMpKVkEPrPa3kU
	6AhD4t0g==;
Received: from localhost ([::1]:29832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUFGD-001dke-A9; Fri, 24 May 2019 18:49:45 +0000
Received: from [2a01:4f8:192:486::147:1] (port=13818 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUFG8-001dkW-QV
 for samba-technical@lists.samba.org; Fri, 24 May 2019 18:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=WrUUWSbgwSk9L1LG4NvPLxlPuE0dgu9LqZKf9+J+9yI=; b=hvqLGQNJ/ZGsyBh4tUCo4ENrQG
 0hRQlV7dGSt9WfiPoccyFhjbsdLNwLLX/8vWEsKRtkkW7OaisqjMS6zfgxAqRpjq/v1lt0WgICJ9X
 lOkGv+ZWtlhQ/yZgugdENbZblaMbneN8B60yOGjTNDWKyawmjci04+nBYzWODsonbBCo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUFFw-0003kr-5R; Fri, 24 May 2019 18:49:28 +0000
Subject: Re: gitlab question.
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <20190524174326.GB136126@jra4>
Openpgp: preference=signencrypt
Message-ID: <84ab1d9b-32b5-e51d-fbda-8ed801a1a878@samba.org>
Date: Fri, 24 May 2019 21:49:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524174326.GB136126@jra4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It's git fu that you probably already know :)

git remote add gitlab git@gitlab.com:samba-team/devel/samba.git
git fetch gitlab
git checkout -b slow-bug13964 gitlab/slow-bug13964

Uri.

On 5/24/19 8:43 PM, Jeremy Allison via samba-technical wrote:
> Asking to improve my gitlab-fu :-).
> 
> Ralph has a branch containing modifications
> to a patchset I posted here:
> 
> https://gitlab.com/samba-team/devel/samba/tree/slow-bug13964
> 
> I want to check out that branch so I can
> see his changes as a list of git refs
> (i.e. I want to checkout a copy of the
> repo it created for him).
> 
> How do I do that ?
> 
> There's no link on the webpage showing how
> to do that.
> 
> All there is is a button with cloud icon
> with arrow pointing down, which when clicked
> on (hurrah, it was a "Download" button,
> wish it had actual *text* in it so you
> didn't have to guess what the icons meant
> but there you go) shows the options of
> 
> (off topic, web accessibility is a hot
> topic at the moment. I don't think these
> icons work for that).
> 
> "Download source code" as "zip", "tar.gz",
> "tar.bz2" or "tar".
> 
> OK, maybe that's it - download the tar.gz,
> unpack.
> 
> Nope, just a snapshot of the source code,
> no git information included. Not useful.
> 
> Anyone know how to do this ?
> 
> Aren't web interfaces wonderful :-) :-).
> 
> (yes I understand the irony, given my
> employer :-).
> 
> FYI, this isn't a gitlab whine even though
> it sounds like it - it's helped us do more
> things better than we were doing previously.
> 
> I'd just like to make easy things easy :-).
> 
> I'm happy to have this email forwarded to gitlab
> developers if anyone thinks this will help !
> 
> Jeremy.
> 



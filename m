Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A21EE1D1DB9
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 20:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NfgQe2+nafCGAy3KInR1PaZzt3QJ0e/rJLOeeCIa2Og=; b=w7UVKq09PsyjbY1bbdfi7W/04J
	EpWm9qzdy85JN3lc+5MQ0tAcI3EaGGXRppq+VM1zNenNQfIuyg2RUX983J+4ii7FB48u3l/qn0C1O
	SCgvW4zcyC/cTq1wJUzqmg9JYPVA2Q01cZ1VQ5Y9DCsXEGyRMESwI9z96UDvxoJQXDtKaNszc7HTX
	J21lB6o31d5p5iNhsBlz9ZOmVW8yGzUKKxZHM/kNRTxx6fbhPFHlmuqeBnNk6jmAd07CC80SatjA1
	fWyiRHbSP4yAQMmuSvUoe1d0/zut+dV84PcwlUYo5bRizZz2XoSkIViIGEKDubD3sADdSG2SKKOry
	7/l6JfeA==;
Received: from localhost ([::1]:42926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYwL7-004EmL-Oi; Wed, 13 May 2020 18:42:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYwL3-004EmE-Aj
 for samba-technical@lists.samba.org; Wed, 13 May 2020 18:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NfgQe2+nafCGAy3KInR1PaZzt3QJ0e/rJLOeeCIa2Og=; b=F4CikX8YZsF1siy/1KpeNtT+1D
 3096PjCzwnoF3oeU6G4NK083G/HP6+c7t+TW97BkTX413sFHsTLI2oXbAg+81Ua82kHvPEYNuJmap
 DFqx/s5lKRFkd6dJmPUUjqsFJsbcdqWMvEIVYZJE5b1bW+FVJDilVpAs8rmhJRJQZJswFNxgF4JDi
 r68cnrNR4ReW6Qc3KtU9ELG1VAgZgJk2U428Uet1ozj6y8UgfgNMm47Vb/cmZAxDAPm2Z3PlTPAq1
 FiXULDg7IlEPKAGj1KQJhnDgkPtaipJvKcwp6WozHfjNmJIs7a4WzqmPT/m7yWHkg0gNSs2bg7CyU
 TlLz9FhQz5MwEiuvj7mdA9XvII8JJVj+uux+Z4mYL4qGO/e6GO9xZHRuSD4f93Tvxbvhkchnt5RN+
 S/pwSJ0aER8mamonEVcAuxzlv6vlWo1+4zqWg/ehrKMSeR3gYWD8I+sUAvzg19g/fsqjuGFvNXXH6
 MF7QFdMvHZkSP/+bnIDYzQRq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYwL1-0003K4-3z; Wed, 13 May 2020 18:42:40 +0000
Date: Wed, 13 May 2020 11:42:33 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200513184233.GB9585@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
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

On Wed, May 13, 2020 at 04:42:30PM +0530, Anoop C S via samba-technical wrote:
> Hi,
> 
> Following is a question I have regarding the interaction between two
> smb.conf parameters mentioned in the $subject. It can very well be a
> misunderstanding from my side.
> 
> We have both "store dos attributes" and "map archive" set to 'yes' for
> default install. But according to its description man smb.conf(5):
> 
> store dos attributes (S)
> 
> . . .When this parameter is set it will override the parameters map
> hidden, map system, map archive and map readonly and they will behave
> as if they were set to off. . .
> 
> My question is around smb2.read.access torture test where it tries to
> open a file with different access flags including SEC_FILE_EXECUTE.
> When run against a share with "map archive = no"(or implicitly assumed
> by "store dos attributes" set) we cannot expect execute bit to be
> present for the owner. Thanks to Ralph(and Michael, Guenther) who
> helped me understand basic selftest architecture which adds
> vfs_acl_xattr in [global] section for many torture tests including
> smb2.read making it pass with `make test`.
> 
> Nevertheless, leaving "store dos attributes" at its default, why would
> smbd create file with execute bit set for the owner? I hope its not
> because of some umask calculation done at the end outside Samba because
> if that's the case I would expect it to be set even when "map archive"
> is explicitly set to 'no'. There seems to be some mismatch between
> assumed and real behaviour.

Quick check - does your smb.conf have "obey pam restrictions = yes"
set anywhere ?

That can mess up our mask calculations. Let me know that parameter
is set to "no" before I dig in further :-).

Cheers,

Jeremy.


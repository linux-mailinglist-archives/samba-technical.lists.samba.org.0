Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BA7E9F2E
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 15:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bk4SAuPLUS/Y72rpQeTxPQCE0eLnG5WbdjDCqowss98=; b=WmfgmqJK8VUjwtUn5oD4+6Yw73
	cF5O/hIUTC8gzoCOOFTMRjiXgGCfu0iGpekb/ovrnrBEgJK7lSO6I3+b/d1Rrr8DDRwxLYYvlm6/a
	Cnh7Ha8gCOcec3dU/XvKnqqcF+SqwtsmfDNDlBz3G+pCYeRwJPmdOZVQq6m5QXQYubUZ/IR4axlYl
	K126ygK7jCcNFQFxVuL1vSPz64gZAqu8Sz/MivuhY7HOMhfN/NiIbN3xMWeqJabqPdj7Lfw8ovN23
	amqo+RCVOt5jGoi7IUMFd5Cz9eEYIQOAXXTnAMUAkaxErodqXTUEuTbw5zJhK0Lx8+TeKO1o4ZezP
	Dl2NQHbg==;
Received: from ip6-localhost ([::1]:26826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2YGt-007xMJ-3k; Mon, 13 Nov 2023 14:50:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2YGm-007xM9-5z
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 14:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=bk4SAuPLUS/Y72rpQeTxPQCE0eLnG5WbdjDCqowss98=; b=ylyzmSSrKVEXBUurV+orJh+DCp
 fRuAoH9znNfcMGy3/dKIJP8QMFP9e7WLrFvuRYvbTEogKeRXz6YzZ5f0fZTaxIPNMFc/iayhSAnqn
 TGmYoXOpKM03bVxTCtCLEV8roKuqbT1MGD6wX+YmjUgYiaB3VYGqEXETG7NdeHbyzRNE3yXdN+C3a
 w8tSgf5HCvZM0gngsqVRjP4wf2K/KEVCvmbcdAj091sVKpb4llDoQwpJ2GNeUqkgXz+/R6H5hQ8gu
 JI8i5a/wNG6zgdo9ZVO3x6xDYJLF0eEgWxTe9/yl51wLNplJT0vf4E2KXCTwKT/mlvx8wAQXgAK4g
 0+cKgGF3zsfT2Y3CxCTVn4+q8+CVNdX0xu6BSFByRqRXSYPHyXY/9iZ6hNJnGpKc98VOKT/0sf4FI
 iVe30MAMBJL2PA5+PMwAyig5U/eqCwPFRYqgA0RpRixu+RZX7qpyMZJN7fu2Gp83QvWfjen1nXBrO
 RASIhnnswcNWqIO2eQz8yiqk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2YGg-005vw7-2j for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 14:50:28 +0000
Message-ID: <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
Date: Mon, 13 Nov 2023 07:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: I want to make ADCS support better and I need some advice
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
In-Reply-To: <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 11/13/23 7:28 AM, Ralph Boehme via samba-technical wrote:
> On 11/13/23 14:56, David Mulder via samba-technical wrote:
>> I'd additionally like to be able to contribute rust code to Samba, 
>> and I'm certainly glad to see someone wanting to work on certificate 
>> auto enrollment. I know there is some opposition to providing rust 
>> code in Samba, I think because of platform support.
>
> iirc this was about AIX for which we do provide our SAMBA+ packages, 
> but last time I checked several months ago AIX support was about to be 
> released in rust, so this is likely not an issue anymore.
Hrm, interesting. So perhaps we could work out a way to include Rust 
code in Samba.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com



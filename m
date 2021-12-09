Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C046F3A2
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 20:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Ea6PchSsx7YjEC/bqfAU5UvcZhsXLpBTzHytheQzB/c=; b=clf61R6d2MnoGekdUx0Suj1HAE
	L37m4VCA6af7RHnVsKys6rTFooLXfUsrAxLDAAONivwvq0Q7dIZNjveGL0hic8IBE+S0aucxYlU4M
	N4JvqeTgT2Q6oR7PDWwUDDOo1ICNc4EEMLBb4fVDBkwYQUc2schx6p+onSFzkKTRNXTnSwF2cerni
	RfCcIQLjjuyLBkJOBj/fMx7SmTIgLA5ylaqSNN+DK3fN9K4IRQjiNkhL681/hZ5ZGNJEdZmzKQyty
	x4Rz9ycGZHYBn8pYq6DkGlEy1jrOXYOa5XufqfOKmV3/IJs6ApO9NytEbauLUnj5Hfw/17y9P9BL6
	BdacucYQ==;
Received: from ip6-localhost ([::1]:38720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvOkk-004gqc-39; Thu, 09 Dec 2021 19:06:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54388) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvOkf-004gqT-Cw
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 19:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Ea6PchSsx7YjEC/bqfAU5UvcZhsXLpBTzHytheQzB/c=; b=YibDW8HAdhQ2ujHSa2EMAFMd9p
 r4QfGAy6WDj33DmpSNJdSjXeg8QyL1JbAJ28tUTrpy/DUATk3cpHR4b3ofcxOyVPhRyhrON2PfSQs
 qwXnEL3nAr7PFB+IH06EvB6NqTQsNcwPsw0HhBLPKqflL/jMdgg6ieadk1eyNV6yl7WFGw3gXcxfS
 aT+/Y5LZ7ZrWpbVruxLDtoclPDmO+EdvvIOFakKrGNAwZeUqZPKl6B+B/w9P4rRmFWfbWrlWIIB0v
 OhFaqu0mfc4J967KWqQXC2LvJPzmbIL8dsiSVkRz6IgwzXCYbHPlKaO0qUG1HTXndoGi8Jg1U9lKp
 w0sp1BbNSxHQNxK1vERikMuuE3XEvFiKE+cMFtEeMvwuSSctQUrYbKYRVAPeU2d56szuDVq/utWX4
 ewFj16ZtCSEqGHPK8l9U5/jsi9pguJeRVEncGLLT6J490NlBa7sDlUWP0iV2uZTFFrV+ITnHm2uPj
 KivBPT5ygDLTz0Z2kHdEhSuR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvOkd-0021ns-JU; Thu, 09 Dec 2021 19:06:44 +0000
Date: Thu, 9 Dec 2021 11:06:40 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbJTwPO4ytMGFPoc@jeremy-acer>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 09, 2021 at 07:58:06PM +0100, Ralph Boehme via samba-technical wrote:
>Hi Tom,
>
>On 12/9/21 19:48, Tom Talpey wrote:
>>I really think you need a bulletproof mathematically correct
>>uniqueid generator here.
>
>Patches welcome. :)))
>
>I guess all we can get is an approximation.

GUIDS !!! :-). uuidgen :-).


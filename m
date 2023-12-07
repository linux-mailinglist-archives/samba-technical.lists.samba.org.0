Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC1808FEE
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 19:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=U54oUgBdDBv69Iy6UYcPDEqi69VKSUFJNJev/TzXD7M=; b=dJ4BL0yubpWfp3Y3XEJj1kRiIf
	j50wx3CYsOq4q5Z8E0hJ425OTvI/R2r3ulYra9Yj8SbruQmslehpKpylHhWjoZCnLkRVQZ7v8LRKf
	la8gZyj/zjhfQqXnXCKWn1Hj8wz5WHdJ7WXgCfdac1SK2DRqZHXnUlbXheeF+s4WOD9EZuCBOGx+W
	ghjAIVBZN/fbpoJ7TQCrHwemILkefTdkBRs1qpc40K/p5xDOW7I2GD53uHspjvTHG9cNMbBFz5nMR
	t/L7GdgjSxk9t314xpflSZow/KkhCrtukOACX7KjSvt+tmm8JpIKwQJVYXmCE1k/KXqSJl0PY+Vgi
	gGK3nEvA==;
Received: from ip6-localhost ([::1]:34438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBJAu-0051Q3-8T; Thu, 07 Dec 2023 18:32:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBJAp-0051Pu-5O
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 18:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=U54oUgBdDBv69Iy6UYcPDEqi69VKSUFJNJev/TzXD7M=; b=NmJyB0KhZxJAKM0BxFF2BO/X72
 7Ikeyj+sfNULuzhvGSpUqqDizz3AR3Q9FyhTBQZ3XIGO6TApoddLwLU1yqz2fn7arRWHbAbFB7Pjy
 NhqAMkY04RSNVQC6BGf6nphXgEA7jboTEL5SzXDCrtapYs+HTZcOqYfNRI/viY0/Bn5zIBo3hLzWA
 G5Dd0OfBd7z5j0pSKus6evFpm3KeWUvTsHoGhq5nxgLqCcS2K7cyyCqw5CBUwO5vLLHZzmo/rFAwW
 TlbdVCNxiW/irTH8mV/tLtdLhioK6wF/n9FReweKHo+6RfpnCIfoa1MnfBMyUhF9eARYJoIlTUjPu
 cnEyvZLNRgDqyXetLQGLXkQeIBacrs07oQNJPQM7yhaKV4pNw7emA+4+t3WWej/nqdkzvo35nIgBC
 bTrT6ac2/dt1sbNdAqfPF8v7bHiWGyFf32WHFmQvUioaji+8RYUtYyt+E0iOLvQHZG0g51/fx/6ms
 NDwo+M3wvUu5K7G5vZY64fRE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rBJAm-002R73-0W; Thu, 07 Dec 2023 18:32:33 +0000
Date: Thu, 7 Dec 2023 10:32:27 -0800
To: David Howells <dhowells@redhat.com>
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
Message-ID: <ZXIPuwnUNycH+ZuI@jeremy-HP-Z840-Workstation>
References: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
 <700923.1701964726@warthog.procyon.org.uk>
 <1215461.1701971450@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1215461.1701971450@warthog.procyon.org.uk>
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
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 07, 2023 at 05:50:50PM +0000, David Howells wrote:
>Jeremy Allison <jra@samba.org> wrote:
>
>> >Further, are the two ops then essentially done atomically?
>>
>> No. They are processed (at least in Samba) as two separate
>> requests and can be raced by local or other remote access.
>
>So just compounding them would leave us in the same situation we are in now -
>which would be fine.
>
>What do you think about the idea of having the server see a specifically
>arranged compounded pair and turn them into an op that can't otherwise be
>represented in the protocol?

Complex, ugly code. How long does the server wait
for the second operation before proceeding with
the first ?

>Or is it better to try and get the protocol extended?

If this is a Linux -> Linux op, we have a protocol
space (the SMB3+POSIX) we can extend without having
to go via Microsoft. But this would need to be very carefully designed.


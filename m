Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 295B98CDD07
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2024 00:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jgLiZwgqHMSCIjnuUjkSdN8ATR1To460rOqPAkvpqjc=; b=zTitDgJ3QJvIIQ3QKLOG7FHpQJ
	5T02rUyxGp8qHJkbWaM02EBIyby9VN0dfWqbJwc4aTpRfEUXs1sm4OiUV09XAGVpakNMXtV2q2QwL
	nhKYvqzQW/sZvxqvKpYL4yBJ8ECl8pQDAq7AnveI3dX+LMk0cOIIps11R3xy4YQKzV7W+QrG2SluM
	+1hMm2O1J6hPpf8D9QTAPxdkMGLnVdAugCDpqTTjbz3zJOAqpdWd9Xs/7IX9zXwIl3FCLfIFSLpxS
	ZGRZ3p38ECOVvUJGGm6CtCoPBB22UvB2N8OZRT3RwyUWmy+7/f+mT+aPeQzaMPW13ry7uTQuhVqQS
	unL9Pf4g==;
Received: from ip6-localhost ([::1]:23834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sAHGC-009nme-O3; Thu, 23 May 2024 22:50:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17800) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAHG7-009nmV-UQ
 for samba-technical@lists.samba.org; Thu, 23 May 2024 22:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=jgLiZwgqHMSCIjnuUjkSdN8ATR1To460rOqPAkvpqjc=; b=Z5wOlQyXPeMLx7Z4LJcsTQoSai
 4JVB5w3Xeqs3EuLI4GDETPu9FYBkujOvPrRQG1zPrTZt9P1i1HtS/b25qTQMPOM3rQQdkgllaJN0N
 GZLglMk6DYKZxQ/YPjd7jn4vUrX/coXZ/ZDPAAexqBZ+sOQ7Xc3yDHiLW9xENTMcqyjYqk4aoZyeR
 b2gYlNI9vi2IQlmIMZoMiMCv5vDF9Z8VsUUpyPYalCdeDH9GcOVit1U5GG7y1p/njWTLkyECxQACy
 ksAWDmNFfcJp6jux9eS+cx9UDZ0HH68z2WsBMjdEUx3x3w4GqTLz/0iAZ3vFn1fFdM4jalRs6u0wJ
 1d0mTFgVNJoKs2D1L529XKo9+PIFDLRpclpO13piEFmbVQUJ2qexGPneU6bZBOnUBC11/dOzbd76U
 OuihhlFdVNVMI3bufCgJfhSPrBMP7KBqWO9ltilZ/Bh3AWwqutbMmH8AWOLMzoRbOwXbrCsY/X0zH
 cgBzdks0xDbKvIfna1zd3w2k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAHG2-00CsRT-2l; Thu, 23 May 2024 22:49:59 +0000
Date: Thu, 23 May 2024 15:49:51 -0700
To: Paulo Alcantara <pc@manguebit.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
References: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
 <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <af49124840aa5960107772673f807f88@manguebit.com>
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
Cc: David Howells <dhowells@redhat.com>, linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>,
 David Disseldorp <ddiss@samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 23, 2024 at 12:28:35PM -0300, Paulo Alcantara wrote:
>Tom Talpey <tom@talpey.com> writes:
>
>> Yeah, I think this is a Samba server issue. Ronnie is right that it
>> should return a partial response and a STATUS_BUFFER_OVERFLOW error
>> indicating that it's partial. It's not supposed to return
>> STATUS_BUFFER_TOO_SMALL unless the entire buffer is less than one
>> entry.
>>
>> MS-FSA section 2.5.10.22
>>
>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fsa/385dec98-90fe-477f-9789-20a47a7b8467
>
>Yes.  I've just tested it against Windows Server 2022 and it correctly
>returns STATUS_BUFFER_OVERFLOW.

Bug is in fsctl_qar():

         ndr_ret = ndr_push_struct_blob(out_output, mem_ctx, &qar_rsp,
                 (ndr_push_flags_fn_t)ndr_push_fsctl_query_alloced_ranges_rsp);
         if (ndr_ret != NDR_ERR_SUCCESS) {
                 DEBUG(0, ("failed to marshall QAR rsp\n"));
                 return NT_STATUS_INVALID_PARAMETER;
         }

         if (out_output->length > in_max_output) {
                 DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
                           (unsigned long)out_output->length,
                           (unsigned long)in_max_output));
                 data_blob_free(out_output);
                 return NT_STATUS_BUFFER_TOO_SMALL;
         }

I'm guessing in this case we need to just truncate out_output->length
to in_max_output and return STATUS_BUFFER_OVERFLOW.


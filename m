Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 150348CE1B4
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2024 09:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Perns83kB4/YQ1fy71ZlZLOPLgyRS+xtq7Rb7jPGzso=; b=sCysC0pBYQ+geScYga6Cc6pENy
	540lp493mT8L6GofOODRqz8z8iTnLYUQtgHphEmOBpP/E1msDepBCMiOfU4kU2EvGnUL8j8liJF8N
	PRyqmj+DQDFkXKPImfF1PyAdLqTUC8pHHtXea6v+c0KJy6rql09jdvBi/QM+s/6SXbnpj5FLHx8cS
	GEH0q4PvFRYWbcSE4Ih00RQU9N8GyFX7xQQnFyM+3lKm2KM5p28pAk+ortFGVndfG5xX/40qfTmUT
	2eBh5KY00WFiNbit56m/T3VwBfMzHKSq1Y2teklH0GA4Xf3nVZmjljORdLU206nkfsiWyGHU5vO7f
	/AIOuA7Q==;
Received: from ip6-localhost ([::1]:35482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sAPcw-009osL-15; Fri, 24 May 2024 07:46:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25910) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAPcn-009osE-GW
 for samba-technical@lists.samba.org; Fri, 24 May 2024 07:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Perns83kB4/YQ1fy71ZlZLOPLgyRS+xtq7Rb7jPGzso=; b=vvIP+XeNgn31T8AeT95ndhn9YS
 fCahTeNMJAskV9g2mYqjVc2i3nCtNxRoCmA+9ueoVLezPoHxibwDuIR5IccMZLtWBeITs5ETXCjiS
 JzBSu6siJe3/5+qSToJ042b6UNT8w7c8n9XaM0t752u9QjXOXp9Yb8wvDQRFAFMlpmfjswzOujFuf
 02mYoRz5gA4iR1sRRJ4FQhbzucKCfoVaUTcjZNGSX9ia23cFBG4wYNoiPREHIAEEStaoJpZSXarmS
 gQIH/9JCJISA57azhDpGB5hBO6oq7jq7WNSHIU3Bf0slHUmGFh51FW5Y9aw5dy82lswCYLdM1/cq6
 RMjk4BiM6b/x1aBsX/u3iPYaqKtcA+YK9Sz6YRKIlZFgoJeRHZIpCZVbbUy8bDS8J7vrMlPvk8WVD
 14W7SYamfyETwt6kK8ZnDpZEgvd2QOfzjsczRhcob0Jm+B9xW3ZfiGpKtaEeedrLKpfWdzWK/7ouc
 xY7TUQMyrHEkkTKLgGGg9qxq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAPck-00Cwsc-23; Fri, 24 May 2024 07:45:58 +0000
Message-ID: <b2986023-d323-4fef-8944-40d858472a06@samba.org>
Date: Fri, 24 May 2024 09:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
To: Jeremy Allison <jra@samba.org>, Paulo Alcantara <pc@manguebit.com>
References: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna> <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
 <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>, David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 24.05.24 um 00:49 schrieb Jeremy Allison via samba-technical:
> On Thu, May 23, 2024 at 12:28:35PM -0300, Paulo Alcantara wrote:
>> Tom Talpey <tom@talpey.com> writes:
>>
>>> Yeah, I think this is a Samba server issue. Ronnie is right that it
>>> should return a partial response and a STATUS_BUFFER_OVERFLOW error
>>> indicating that it's partial. It's not supposed to return
>>> STATUS_BUFFER_TOO_SMALL unless the entire buffer is less than one
>>> entry.
>>>
>>> MS-FSA section 2.5.10.22
>>>
>>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fsa/385dec98-90fe-477f-9789-20a47a7b8467
>>
>> Yes.  I've just tested it against Windows Server 2022 and it correctly
>> returns STATUS_BUFFER_OVERFLOW.
> 
> Bug is in fsctl_qar():
> 
>          ndr_ret = ndr_push_struct_blob(out_output, mem_ctx, &qar_rsp,
>                  (ndr_push_flags_fn_t)ndr_push_fsctl_query_alloced_ranges_rsp);
>          if (ndr_ret != NDR_ERR_SUCCESS) {
>                  DEBUG(0, ("failed to marshall QAR rsp\n"));
>                  return NT_STATUS_INVALID_PARAMETER;
>          }
> 
>          if (out_output->length > in_max_output) {
>                  DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
>                            (unsigned long)out_output->length,
>                            (unsigned long)in_max_output));
>                  data_blob_free(out_output);
>                  return NT_STATUS_BUFFER_TOO_SMALL;
>          }
> 
> I'm guessing in this case we need to just truncate out_output->length
> to in_max_output and return STATUS_BUFFER_OVERFLOW.

But I guess we should only truncate at multiples of the size of a single entry.
and return BUFFER_TOO_SMALL when it's to small to hold a single entry.

As far as I can see struct file_alloced_range_buf has a size of 16.

I guess fsctl_qar_buf_push() should also get a max_output_length argument
and should check early if additional 16 bytes can be appended
and return NT_STATUS_BUFFER_TOO_SMALL if not.

Then fsctl_qar_seek_fill() should catch NT_STATUS_BUFFER_TOO_SMALL and turn it
into STATUS_BUFFER_OVERFLOW if at least one element was filled in before.

metze




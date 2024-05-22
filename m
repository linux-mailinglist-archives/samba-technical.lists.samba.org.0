Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AD8CBBB2
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2024 09:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Pm3ooYY/+2EKQCAsfnF7xogS7EKUFB37PMI7jYDqwFo=; b=zPKA7PAb7A2uw/2DG3DOzWAmw9
	aEBaktfKjOL7Hm7It9FXjHDQwp21+OtBJiVeSm32PPyFSxl3fVS23as3AUVNh4DtQeLjs8tirbUTN
	QEmOSxeCOZAbARArpN7seRGPklsfLqnfAJNBe83cQ9w4w4y7y47jFE/qjIGCcxt6O0MWhTsk3chnu
	H1lnWEEpJpuvMzw/Z3hWdM7lk4urloVgSTBklir98UzU5+iYJehmbSOqdlOqZuXXHXUWIVmfGFq69
	Smb7++R2nZrk2V85c5agBr8BIzEwfoeWbgoWJ7r1RuVEiuva6Kx8MCtPa9d/hs5T8i6E6vZGJim99
	4SUySReQ==;
Received: from ip6-localhost ([::1]:42332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s9g1b-009b0g-AQ; Wed, 22 May 2024 07:04:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41188) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9g1M-009b0Z-3X
 for samba-technical@lists.samba.org; Wed, 22 May 2024 07:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Pm3ooYY/+2EKQCAsfnF7xogS7EKUFB37PMI7jYDqwFo=; b=kBJSpR9Wrkg5blvBPBNC8K+Yjd
 wEhwPIcVj6OORjXApTa19oBLL5jZ3zLdZyIjjkrCSb7QrjNmFXyjvVSeWTrcDsbXGeJn3/nBd3Abd
 i+0wHcPh5o6JBNqSR0J/+DYdYpsvmHpRqFa2UipuhoYs01YD95mvNDzkSggmerOMjY90nZiw9xduF
 TnDegYW3vpX6q1JRWfo0B5eVl81NEGKn6hfXP+fIU8l5pKz4k99PKpta8A4ftYGjyZvgmUMVQytCk
 BxsOLaBX8zAblurRkP5Ej0ICLwpSC/PQGIr1OlPQEBNZDsgRNPr3VbTm9qQXk86Y6j2VbBGH5I+YY
 tGyvQouaEKqBln4RIKD3H6hmN+ijt8MAfNpa6KK1+yPJijiKY07C9/np4MRLmxgwwUfMGbnBpWEM6
 CSRB8q5K/js4OeCz5vyErIcMUxSZCzyxsVxxNujQ3QjpuXBo6T2ZWk0LcSunFvwOUxTrAPfQ8P1n9
 87pgfmn9D8xPxeDEHsFNh20d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9g18-00CYS1-2a; Wed, 22 May 2024 07:04:07 +0000
Message-ID: <651e3916-3145-4578-af9b-c0712c1322c6@samba.org>
Date: Wed, 22 May 2024 09:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving smbd_smb2_request_setinfo_done/smbd_smb2_request_error
 tracing
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <e9b3c0d0f1a94a8977e067c048eb56592d6bfe49.camel@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <e9b3c0d0f1a94a8977e067c048eb56592d6bfe49.camel@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 22.05.24 um 00:23 schrieb Andrew Bartlett via samba-technical:
> Kia Ora Team,
> 
> I've been helping a client out who is improving the Go SMB2 client
> implementation and today we got caught in the weeds just trying to set
> ACLs on Samba.
> 
> We probably have something really silly wrong, as despite being root
> and just setting an ACL with smbcacls, it fails.
> 
> Anyway, it was heavy going debugging partly as our logs are sparse in
> that code, and partly as even when we have logs, the very helpful
> 'location' macros don't work as well as we would like
> 
> So smbd2_smb2_request_error() prints the location of the failure, but
> if that is just smbd_smb2_request_setinfo_done():137 we don't get many
> more clues.
> 
> Is there a legitimate way this this be unwrapped (I see I'm not meant
> to read the guts of the tevent_req) to be
> 
> smbd_smb2_request_error_ex(req, status, NULL, subreq-
>> internal.finish_location)
> 
> I still don't do much with tevent, so I'm wondering is that legitimate
> in this code?  Will that always be filled in?  Or could it be NULL, and
> can I rely on it at least being initialised?
> 
> (eg so i can do):
> 
> smbd_smb2_request_error_ex(req, status, NULL,subreq-
>> internal.finish_location ? subreq->internal.finish_location
> : __location__)
> 
> Anyway, just wanted to give feedback and perhaps improve debugging here
> for the next person, but lost.

tevent_req_print() could be used.

If you have that please also change the other cases in:
smbd_smb2_request_getinfo_done
smbd_smb2_request_lock_done
smbd_smb2_request_flush_done
smbd_smb2_request_ioctl_done
smbd_smb2_request_find_done
smbd_smb2_request_create_done
... (for every SMB2 opcode)

But maybe a explicit debug message after the call to
the _recv function and before any TALLOC_FREE(subreq)
would be better than passing it to smbd_smb2_request_error_ex().
smbd_smb2_request_ioctl_done() has something in there
already...

I guess in mode cases we want nt_errstr(status) and tevent_req_print(subreq, subreq),
plus some additional value like in smbd_smb2_request_ioctl_donesmbd_smb2_request_ioctl_done()
there disconnect would also be useful to print...

metze





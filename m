Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CA33DD96
	for <lists+samba-technical@lfdr.de>; Tue, 16 Mar 2021 20:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7OiCi80y2WuBz4nxLbRfr9nUjiMz4B+568j2Ymu5SHg=; b=eBOb70N3Avr9WM6N/hheC8Pj/k
	peSJTLgdOuiZReOPiPWKzjAVYWTfKPe7sXk4hxO5br1YdRP05r6Gvh/rR2T1Doj7q2DTfea1lrjzs
	QjWXLAr9RJeeq/Md2ZZHAydF3lF2ZF1JeDsP0BZGM8yRJb4xMYimQxqlOoCVYRMo0wN9ZEoOrvJ4k
	DYgeQ3sRIe+Azdw0lMWaIAloMVIeJVHveYpS02v7KHaVKqhj0XRDxeqRhrRfBXcq33FKH4LcChYBI
	ovWKgzz/fFjfrNKkTaAtpVEVQnEu+KrAHqVSJ8/GmGhZHsHDhuuWvH5b1PPHDYk9reBGp8pikuahp
	Q96p6DGg==;
Received: from ip6-localhost ([::1]:37288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lMFQC-005k8m-NT; Tue, 16 Mar 2021 19:32:04 +0000
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
 ([173.201.192.103]:54717) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lMFQ6-005k8f-9v
 for samba-technical@lists.samba.org; Tue, 16 Mar 2021 19:32:01 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id MFNplOVBiBt9YMFNqlPnBL; Tue, 16 Mar 2021 12:29:38 -0700
X-CMAE-Analysis: v=2.4 cv=C/0sdSD+ c=1 sm=1 tr=0 ts=60510723
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=SEc3moZ4AAAA:8 a=3-RhneuVAAAA:8 a=ihd_uDuFnh7xnqKYafAA:9
 a=QEXdDO2ut3YA:10 a=5oRCH6oROnRZc2VpWJZ3:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH v2] cifs: Silently ignore unknown oplock break handle
To: Rohith Surabattula <rohiths.msft@gmail.com>
References: <20210316124808.11984-1-vincent.whitchurch@axis.com>
 <93d506a6-5832-5006-3bab-6e8e7203da0e@talpey.com>
 <CACdtm0ac+oE1+KNbOGWhy-j9XHmUn4AXG6zAaX-nL0W=NJxQMA@mail.gmail.com>
Message-ID: <4836330b-3d2f-9d35-4d03-3a457b0068a4@talpey.com>
Date: Tue, 16 Mar 2021 15:29:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACdtm0ac+oE1+KNbOGWhy-j9XHmUn4AXG6zAaX-nL0W=NJxQMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH6b3PF8QhOqJznv110kIMK+CLaMTn7+5O8zIx0dZa9FNVemvhe0/KfPSyC510OhKOT9JghaMrb3qjtoVCjYAbpoOKhULCOq4cAsrLRbuKdXuHRyeyuA
 rWj1QAdjnkSU1QN18U2+Insf4dP+C0yHalejORzzgacQEAKJgsg1VI0+mS9mUCnM81Gv6Eb2Zz0cf318OBRDEOlKClrzutpWnHcjZQCtjcwAsifRoSld21to
 CBxGGxyfajqvxaB6jK2FcXl9Unqc9fmvODToXzyEt70KolifOWp5ynQ6jSFY5mky0cUf5XJiM0fpCa5k9PfzsIl5WxpLRnTpGt675sBCTomtbmMrPJaBCBZp
 /aismpvUmDzumrOQkNOU09rvy0ea6/apTwWrKclr9yEbmsU5RSFs5nWWZ1J4oHDwQUNbcSoG
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, kernel@axis.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/16/2021 1:36 PM, Rohith Surabattula wrote:
> This issue will not be seen once changes related to deferred close for
> files is committed.

That may be, but it's irrelevant to this.

> Currently, changes are in review. I will address review comments by this week.

What do you mean by "in review"? Both threads are active on the
mailing list. If you or others have something to discuss, please
post it and don't leave us out of the discussion.

Tom.


> Regards,
> Rohith
> 
> On Tue, Mar 16, 2021 at 9:33 PM Tom Talpey <tom@talpey.com> wrote:
>>
>> On 3/16/2021 8:48 AM, Vincent Whitchurch via samba-technical wrote:
>>> Make SMB2 not print out an error when an oplock break is received for an
>>> unknown handle, similar to SMB1.  The SMB2 lease break path is not
>>> affected by this patch.
>>>
>>> Without this, a program which writes to a file from one thread, and
>>> opens, reads, and writes the same file from another thread triggers the
>>> below errors several times a minute when run against a Samba server
>>> configured with "smb2 leases = no".
>>>
>>>    CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
>>>    00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
>>>    00000010: 00000001 00000000 ffffffff ffffffff  ................
>>>    00000020: 00000000 00000000 00000000 00000000  ................
>>>    00000030: 00000000 00000000 00000000 00000000  ................
>>>
>>> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
>>> ---
>>>
>>> Notes:
>>>       v2:
>>>       - Drop change to lease break
>>>       - Rewrite commit message
>>>
>>>    fs/cifs/smb2misc.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
>>> index 60d4bd1eae2b..4d8576e202e3 100644
>>> --- a/fs/cifs/smb2misc.c
>>> +++ b/fs/cifs/smb2misc.c
>>> @@ -755,7 +755,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>>>        }
>>>        spin_unlock(&cifs_tcp_ses_lock);
>>>        cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
>>> -     return false;
>>> +     return true;
>>>    }
>>>
>>>    void
>>>
>>
>> As an oplock-only approach, it looks good. But the old cifs_dbg message
>> "non-existent connection" is possibly misleading, since the connection
>> may be perfectly fine.
>>
>> When breaking the loop successfully, the code emits
>>          cifs_dbg(FYI, "file id match, oplock break\n");
>> so perhaps
>>          cifs_dbg(FYI, "No file id matched, oplock break ignored\n");
>> ?
>>
>> Tom.
> 


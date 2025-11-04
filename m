Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6AC320B3
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 17:26:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cVEicm+5HOPZi8EXNv//e7Ln/RMba4QPS1zib01aWog=; b=CpJ1NUHCAlwCtMaW9Vk2D7ZNOI
	cY+eLoOix+Rvmni43X0c52fcbi5+GK6+dQDDa5BVfCLb7SRDaxKBzcKshYDd4H4jObqCFKir7/Sux
	UuP0EZv9hlhMDtfQqj6vnU5IZHJm8BVpi/ThE9wIZIDg16MXvmWdTNxTGBqtuWst95Nmknblzxazq
	HxNrmM8OxBW3V0dub96JaUKZ9m32AkgPVxHgInqBPvl/qEUjEG37Bd3YIXqK4knYh4O9amVoYdX62
	igrI+BifBfx/WHy0lY2ZhikBDC3oN74QQHbFwvXjDBxmEk/umEHoriFNll7tzB/6Wf6B7bqcT0NsA
	QV1URTXw==;
Received: from ip6-localhost ([::1]:63112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGJqz-00BUT6-RO; Tue, 04 Nov 2025 16:25:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:50316) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGJqt-00BUSj-6G
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 16:25:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3453708f8f.0
 for <samba-technical@lists.samba.org>; Tue, 04 Nov 2025 08:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762273546; x=1762878346; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cVEicm+5HOPZi8EXNv//e7Ln/RMba4QPS1zib01aWog=;
 b=dJaDQbghRLHbAwZlCbutpyGyqQ7CQsxHKb9vTG7Ac9aN9V7nWDH9nVEHqhxXSw+Dcu
 G4+7y8frh7vqiSuu3uKfbdY/MxjqBQ9T82xqhzA20tYnom/ReYd3Kxut7UjMoYH35JBg
 /ATTTWb4LtqFixlx2PJ9QCjjHCvIH+3eY+yheER9d8AjXFStdCa3TYHcW2ZB5evhZ5D4
 +9A8wraMsCx+hhSZ7WVfXc0YfsGpHmdx5YFTKwbsoaazOWCc+tNg0t/d8z811hI9I1iz
 U/YyRubn/Y3BCz9fekBsutzkKMO579n51CY8Xp52pZQKieL8ecX+wqCtwvupgQtRnAX1
 1RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762273546; x=1762878346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVEicm+5HOPZi8EXNv//e7Ln/RMba4QPS1zib01aWog=;
 b=ecLRaxk/3mEzkRRLyjEkhzdNVWlZe3OgOAwK0yH1MzmPRxmvZVKdaL0Cd3+bemk4fw
 VM7/vGUTzEgafZgNt0zeKIMe4tj/9gMlYBqUKPJFTkbzjqLgHLR+x6IoxxIWAAX9RGvp
 obxnVpEG+y+GiGCSi+e+m2sy/HR8KvKfOTHXWuqDcPC1icPOY/aZiYbubq7EdLjA4ekM
 sbQOQiGpza5TSQb+rYqik5rS1tsanD6LXx1h4f3jhDMlzB+nhh/uykTg+xHb8SeapJXu
 pgFyVTCOZoebz+aSudsVvH5n6X3sWvIOaXCrBbKvGywRdA+FzEDnbLtKYvttKA7vxvl8
 uIKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8XRpRld1LMqmpYaZxIuafYLsntyTtU+3VrT4x78R9sOHuWhaIliVwfZMH+Z0erADvuHfGT0/5KEh+zvTeKdM=@lists.samba.org
X-Gm-Message-State: AOJu0YyBJAl37y/vALp6JANKffn4rTAX6LZBT+YPzZlBqYNcM1TK0k9Q
 woYOZphCn1OJLkiuA9GwOhbhiuKztVGBWtUCQZ3j6P9hZVhH8tOYpK6iRksMpkJop7k=
X-Gm-Gg: ASbGncvlzjnuwp+98k5p9iTFGDSTxFBPLBEjdEEvI6Jx6P4S5J66YPX/uyg7hOXRqs1
 rqZSh4u1L39iASIB/VnXoTO87/Gq7JVT0LQtkxPoRMejliwodilm9vx2kMjjNOsGgqmZpclE8il
 AKon2T9h1FEsyJHeUPYr3It09fWPKNz8GtYqoVKyZJSDox/+WvzM3qkrDHra43AtKy4EOe+t66U
 nHSKs7Z+t0yxfliCKjHIw3LTFI9aZV2unL/UVnXzlU6GnpfGIfVHUNO4hStvWIJ/i9GjQ37Lat6
 4uxUQeOljg1WmizWQQo2jDbL/VPKOekgkv6d5Pq/L2Urzq7Z/2n2mk+8LmAj5XH1Q3xvPanVWy2
 2/sRa/UJYdV1l5sZdYxzU4e5wZy6gVAFlS47asTJUsGXy6CC//Q7v1fJbicYOqavLOBESOo4GH9
 DwqzgGh8UBUD5Z
X-Google-Smtp-Source: AGHT+IEl3pqh9+PexvH3KC2PQlUbr9Np6CLrnpnOqU7agbJsCdYwehbiMJU1OoVTZIRJc55erxVavw==
X-Received: by 2002:a5d:5d12:0:b0:427:53e:ab25 with SMTP id
 ffacd0b85a97d-429bd6e3ccemr13481854f8f.49.1762273546158; 
 Tue, 04 Nov 2025 08:25:46 -0800 (PST)
Received: from [192.168.15.14] ([152.234.106.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601a5070fsm32382905ad.75.2025.11.04.08.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 08:25:45 -0800 (PST)
Message-ID: <648b7b14-d285-449a-a1b3-4cd062a55b02@suse.com>
Date: Tue, 4 Nov 2025 13:23:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: client: fix refcount leak in smb2_set_path_attr
To: Steve French <smfrench@gmail.com>, Shuhao Fu <sfual@cse.ust.hk>
References: <aQoYCxKqMHwH4sOK@osx.local>
 <CAH2r5mu7s4p88RhUbCm5mqUvEVM60OOTTJOZ+rz09nFfc+t3mQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mu7s4p88RhUbCm5mqUvEVM60OOTTJOZ+rz09nFfc+t3mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
From: Henrique Carvalho via samba-technical <samba-technical@lists.samba.org>
Reply-To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 11/4/25 1:12 PM, Steve French via samba-technical wrote:
> There are multiple callers - are there callers that don't call
> "set_writeable_path()" ?    And so could cause the reverse refcount
> issue?

Yes... Even if it does not cause an issue today, that fix looks like it
belongs inside smb2_rename_path?

> 
> On Tue, Nov 4, 2025 at 9:21 AM Shuhao Fu <sfual@cse.ust.hk> wrote:
>>
>> Fix refcount leak in `smb2_set_path_attr` when path conversion fails.
>>
>> Function `cifs_get_writable_path` returns `cfile` with its reference
>> counter `cfile->count` increased on success. Function `smb2_compound_op`
>> would decrease the reference counter for `cfile`, as stated in its
>> comment. By calling `smb2_rename_path`, the reference counter of `cfile`
>> would leak if `cifs_convert_path_to_utf16` fails in `smb2_set_path_attr`.
>>
>> Fixes: 8de9e86c67ba ("cifs: create a helper to find a writeable handle by path name")
>> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
>> ---
>>  fs/smb/client/smb2inode.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
>> index 09e3fc81d..69cb81fa0 100644
>> --- a/fs/smb/client/smb2inode.c
>> +++ b/fs/smb/client/smb2inode.c
>> @@ -1294,6 +1294,8 @@ static int smb2_set_path_attr(const unsigned int xid, struct cifs_tcon *tcon,
>>         smb2_to_name = cifs_convert_path_to_utf16(to_name, cifs_sb);
>>         if (smb2_to_name == NULL) {
>>                 rc = -ENOMEM;
>> +               if (cfile)
>> +                       cifsFileInfo_put(cfile);
>>                 goto smb2_rename_path;
>>         }
>>         in_iov.iov_base = smb2_to_name;
>> --
>> 2.39.5 (Apple Git-154)
>>
>>
> 
> 

-- 
Henrique
SUSE Labs


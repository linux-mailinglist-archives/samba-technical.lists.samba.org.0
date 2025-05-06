Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D9AAC811
	for <lists+samba-technical@lfdr.de>; Tue,  6 May 2025 16:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ThqEP9ej2hLoxI4uBKqUUvlSLUdMQi6Epl/dQ/QK/Co=; b=BAmfQJzJzI4NSdPlTPOejqb8lA
	v1w4EdkhGh7gFeS8vY5SZXzGKEHplqUem02x4XLeaBehsAFUhJv6IUH0wRpTg0KhWUS0NGQ1XOoV7
	f4C7a7eS5st23fbVJy/Up7rvB8WHrJ3dngX2V9vfRgraXLm1CwHeCx8GMdZfi5b+KmKd/q773lbPK
	6Ns4WJQHjzpiBNcHnKtFi2JMJgC6WgTmZySnE9DOhxeBuzL++ScdN0aWTTxYeYKPxMhtv7+bb3jpi
	Qeutl7VkFFqN1n/GuRjYDmsrhi5AVoM/TSxqY7wohxRzwaGWo0png09MydW4WV5Hr4HSBjzuQFq0n
	2IkQtEHw==;
Received: from ip6-localhost ([::1]:29404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uCJMZ-003B4z-VG; Tue, 06 May 2025 14:33:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50256) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uCJMW-003B4s-4i
 for samba-technical@lists.samba.org; Tue, 06 May 2025 14:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ThqEP9ej2hLoxI4uBKqUUvlSLUdMQi6Epl/dQ/QK/Co=; b=zZpB3+HxhXDEAYMGwPOGs4mJrr
 /uS29TPTAzmo/u+8gkFVcjvbmZz+7AHf/NPV/HUwgVGvdBK9kqBxK0vQOQOCzDvOl6g6kaJXhre4w
 udxAaxaP0LVOc+oRXrt8uxDTkoIdsFqkGo6safXERuxX8pLuKhXFPTfOJsLapbD4CARqx9lh7pqpM
 xPOj7llqyZzpGQLji6XP8PGg3CZWS7yvVPyDW1FUAxx313HigEo1QzmrAYVbJMYnuVAm/PnOYK2Yg
 Z5XQBx5PF3AMS7PRI152hxczV4+YX/SyWafAsE3h9N/xPFCLnOsI91g08TO0y8S8s8eJs2eC/79pm
 Hqe42xzrL59Vjk0+LDm8DyUvNW9umrsjNZkgywZGGDjqKhQDUw3DsZhZXbIDwvaGjOnL+xAtTlVK7
 L5r5lgW+bDI/adqQ6UDXlcUB5JH96ZPW1+w+Ty6T0aZblevwfB4ygSbrtP9G5BXvD+6lxwOoM+51F
 Q2MV2eFHL6zTxFUToC1T+pm8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uCJMV-003tyS-1C for samba-technical@lists.samba.org;
 Tue, 06 May 2025 14:33:35 +0000
Message-ID: <e554bf4b-52e7-4a20-b35d-84a22e056412@samba.org>
Date: Tue, 6 May 2025 08:33:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-tool gpo manage motd set failing with invalid handle on
 s390x
To: samba-technical@lists.samba.org
References: <CANYNYEGAcAcp-T6BMVCaXWfw5PV-x2UJ8UbGOGx9=YpXsz1MSA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANYNYEGAcAcp-T6BMVCaXWfw5PV-x2UJ8UbGOGx9=YpXsz1MSA@mail.gmail.com>
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

On 5/5/25 4:52 PM, Andreas Hasenack via samba-technical wrote:
> Hi,
>
> I just wrote some tests around the motd GPO subset of commands of
> samba-tool, and am baffled at a failure I'm getting only on s390x (big
> endian).
>    File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
> 353, in _run
>      return self.run(*args, **kwargs)
>             ~~~~~~~~^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 3850, in run
>      reg.increment_gpt_ini(machine_changed=True)
>      ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/samba/policies.py", line 198,
> in increment_gpt_ini
>      self.__save_file(self.pol_dir % '', GPT_INI,
>      ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                       out_data.read().encode('utf-8'))
>                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/samba/policies.py", line 99, in
> __save_file
>      self.conn.set_acl(file_name, self.fs_sd)
>      ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/samba/samba3/libsmb_samba_internal.py",
> line 128, in set_acl
>      self.set_sd(fnum, sd, sinfo)
>      ~~~~~~~~~~~^^^^^^^^^^^^^^^^^
It's only failing while setting the acls on the GPT.INI file (not the 
manifest). What do
the acls look like on GPT.INI?

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com



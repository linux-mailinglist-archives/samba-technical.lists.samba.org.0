Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F9BDCE7F
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 09:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bnstyUjD/NwhiBevjWYPNMML7YrpxyTaFchZxHKMe5A=; b=PGBCUISAWBDjnf6JBHXE/Bg1kS
	vJLioOqlp/eI2Df6BpjvTKTmf0BupPxAwhD69qvpEK2PSZlzxo+H/7vpzpXH0hDaB4XEi7oanfAzu
	yQ3Y0i66WSqaoVFY+OoX4ibjaRFErLUwNYeOsnXviZSgkhY16nptlM2XfJ9bwe/UUkL6JNYOYlk9X
	8uCCFV5p5IRAqOZqnXwq8EkW2BXmRdTxMWYcyHltlXMLu88oLq02G/xopt9XVhzLaiRlgNbzGBt4b
	bbK1x/HY46Lcxpx//ngMie7KCKpByVOgi2erYtCByQ6GfahozxQsxovaQFa9YQAgaldL34fhJmxLe
	QacFvaxQ==;
Received: from ip6-localhost ([::1]:38544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v8voo-007o5C-Df; Wed, 15 Oct 2025 07:21:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62442) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v8voh-007o55-A9
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 07:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=bnstyUjD/NwhiBevjWYPNMML7YrpxyTaFchZxHKMe5A=; b=NAXKsZhMMlXg0Rg76nRTI9T5ad
 dxd0zymg8SM8S+JGEdDFQyNlOPtyknUqXwscTJQTVI48NcZ6DCQOokgHX5s91Zomp86CKjbDqcnpi
 ORXh1GjqnGY0nMBBG31owktsv5MC7MY/b4g3Z16oRxUG86ZlnD5mc/M9P6l9l6IvbFda2AGYNT9tH
 yrUA/meY/CopS/NqXJpeU3eWGLPY2BQLZAL6wmsiR5frcsn0sswZLogNvtyjOGOojNMGoVeJoMsqB
 dfXtimKHtex94liUGn3QhHcWlrss0ArujHU20ZI0S4tLZGisPxOlLDGg1mbr4Nj3BB204K6b4O1RE
 w3cSibG9Cq/g904/qRAfg+wzKmk9tC7nOdXkRinhyih4O5t2dGYAIUac67ukR8CcmbJFVc8lTgWQt
 OlrpUBpC0SLaicJf3AJvqR0GDTNFXJMIyo5lKqC4EhdSBvyKlTvB5ta28eXX7M292+FPEgBMDt4/y
 /oMFTqQd1gL6b19QnAUNi3ag;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v8vof-009HnQ-1s; Wed, 15 Oct 2025 07:20:58 +0000
Message-ID: <7af986c8-7050-4b51-962e-dc3984ee1f58@samba.org>
Date: Wed, 15 Oct 2025 09:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] smb: client: let destroy_mr_list() keep
 smbdirect_mr_io memory if registered
To: Steve French <smfrench@gmail.com>
References: <cover.1760295528.git.metze@samba.org>
 <6d275bab3ee66cf653c9e1e242a0a87efa352063.1760295528.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <6d275bab3ee66cf653c9e1e242a0a87efa352063.1760295528.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

as already discussed, one additional hunk is needed...

> @@ -2402,6 +2448,9 @@ static int allocate_mr_list(struct smbdirect_socket *sc)
>   			goto kzalloc_mr_failed;
>   		}
>   
> +		kref_init(&mr->kref);
> +		mutex_init(&mr->mutex);
> +
>   		mr->mr = ib_alloc_mr(sc->ib.pd,
>   				     sc->mr_io.type,
>   				     sp->max_frmr_depth);

Here we're missing the following hunk:

@@ -2483,6 +2483,7 @@ static int allocate_mr_list(struct smbdirect_socket *sc)
  kcalloc_sgl_failed:
         ib_dereg_mr(mr->mr);
  ib_alloc_mr_failed:
+       mutex_destroy(&mr->mutex);
         kfree(mr);
  kzalloc_mr_failed:
         destroy_mr_list(sc);

I fixed it in my for-6.18/fs-smb-20251015-v2 branch,
up to commit e4418cd1d5d80a8c24530ac0a41a5451c44f82bf.
git fetch https://git.samba.org/metze/linux/wip.git for-6.18/fs-smb-20251015-v2

The above hunk is the only difference to the current sfrench-cifs-2.6/for-next
(at commit 7949ce089965bd025a8d46dbaa2f5d0a2bd4ec77), I only moved my commits
to the top. So you can just replace 7949ce089965bd025a8d46dbaa2f5d0a2bd4ec77 by
e4418cd1d5d80a8c24530ac0a41a5451c44f82bf.

Thanks!
metze



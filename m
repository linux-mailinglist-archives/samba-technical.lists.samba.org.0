Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F908B9F76
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 19:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=zFSRw+pXImlnmhoIfV+I/m/A/JbvIZq7Agwz9Bu8OqY=; b=BaSd3uREE/jxicL+DtsJJwCmAQ
	Q50VzvabNpASs14T6dlealy6uwIn/8hzShoHuXFfs7EWyzsA8uGR9H6NmLANnJ03Aejhkuoyg91qS
	wPAcYkLHhFF4Q4lhQknchgD3Fdo4oP9GD8ewawgEXbsHYQ5H6f5xOAqzZRCft/YmMh9QwZ/VI0cT7
	PUaE5uiFjn0SGxhXoFvOE6KICcrBlfIR2SXSd5VWUTKiqYfwA1qI9ykKiSXQg+fuPVbGUrzkFD95E
	i1mIAQyW1AMppVXTXoMOAByu1tQKxNBCOKVpi6RdrFtsSe2q6ryoMhP7lobfV1YJ7eLKOLbHPSX/v
	80zTfN8w==;
Received: from ip6-localhost ([::1]:63980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2aCz-0086yx-TX; Thu, 02 May 2024 17:27:01 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:59490) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2aCu-0086yq-RN
 for samba-technical@lists.samba.org; Thu, 02 May 2024 17:26:59 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso81802791fa.2
 for <samba-technical@lists.samba.org>; Thu, 02 May 2024 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1714670815; x=1715275615; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zFSRw+pXImlnmhoIfV+I/m/A/JbvIZq7Agwz9Bu8OqY=;
 b=fvTPytEK6kzgf52ysvFLMq8YiSpf/UfRmaVZ79H9K8asAKd4Q5tFKAaoMShfG2fDD+
 dIPx5wqV3EtnD2qyc8dQEYU/cVQdVJNg4NJCVyFwwuXiP9RWyJz4O9T1UEsyLMDA93+0
 o3/GkgD3Ch9ef3eFKBCIGUthZ9iTef6WOt0Q9COIp56o7Trdc4gIA42QtRDY3UPg8JNC
 HSCHdCjrn6UWy+Ie4zPjYCvaGimwcb8IMcAbpLxiF7ypPGoHs9sSONheaPrsdmL3lVZ+
 XhHddjucBs02QRJiRvP668lQkJzszeapB83DtD5i02dgw4GYvrlbgyyYGmpi0PrNewx+
 s9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714670815; x=1715275615;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFSRw+pXImlnmhoIfV+I/m/A/JbvIZq7Agwz9Bu8OqY=;
 b=Kv1ERjpPGHArvxuttxe7D+3rlMAPgJLIiig7UeE+DyjCFwH85G9E0DDAPznBZ3+SS1
 7Vqd7ODrCoqQFVRWQDSAgyNWeujDrNb+J3EbfNHTGwO0WSv/2opy/MhBEY07iwr2TTFB
 G8eeiGhfFjrPNX3yvWLxqzIERufdQxUkMpYORovPo6BLgNc1FTO8xPfR/2JyTWv5wvMp
 m8lTNNKCEDPU5WkrkJhxZ37q2TlZu+bVZWjusJy1o6Mu8UP+us9QwfXOfgKW9yNxRBwx
 L2dwJvjctEmd+ZBP35/w8sT3lzhS3WaOwpbKkkeX7HdMM5szDmnMdDqLnrcto0fkIS1s
 bmyQ==
X-Gm-Message-State: AOJu0Ywi6gDsXIYqW6OXuIX57w3r+q8y29CFUbgy+n8yc0pvXrA9XtIW
 sXW39fZ3MS1ijJ8KvTXa/c0Yx/QnpnddtGKBYH7YO+9fWxV5JgHb9L8blPZWCRhI/I4hssdu+YZ
 asvE=
X-Google-Smtp-Source: AGHT+IEsv1iNxF/8B95VI6+R8fNho7Qe8ayzT3AXhseyB61ezsj4ncLIBaFuTabnFPgNvVOnnbx2bA==
X-Received: by 2002:a05:651c:158:b0:2d8:5e8b:7de4 with SMTP id
 c24-20020a05651c015800b002d85e8b7de4mr312546ljd.6.1714670814990; 
 Thu, 02 May 2024 10:26:54 -0700 (PDT)
Received: from [192.168.1.2] ([69.163.66.79]) by smtp.gmail.com with ESMTPSA id
 f5-20020a170902ce8500b001e98f928d0fsm1581856plg.10.2024.05.02.10.26.54
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 10:26:54 -0700 (PDT)
Message-ID: <39324c64-63f9-440c-9d75-46bd3bc1c915@suse.com>
Date: Thu, 2 May 2024 11:26:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: samba-technical@lists.samba.org
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
 <299cecfb-3084-42a4-99de-1970b1b6e2f8@samba.org>
Content-Language: en-US
Organization: SUSE
In-Reply-To: <299cecfb-3084-42a4-99de-1970b1b6e2f8@samba.org>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 4/29/24 9:59 AM, Stefan Metzmacher via samba-technical wrote:
> Hi David, hi Günther
>
> is the code in source3/libgpo/gpext/ and libgpo/gpext/ still used or 
> is everything python now?
I don't think any of that is being used anymore, since it's been 
re-written in python.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


